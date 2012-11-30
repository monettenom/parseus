#include "stdafx.h"
#include "NGameControl.h"

const TCHAR* g_strTilePath[8] =
{
	_T("res\\BackItUp_32x32.PNG"),
	_T("res\\Burning ROM_32x32.PNG"),
	_T("res\\CleanTool_32x32.PNG"),
	_T("res\\CoverDesigner_32x32.PNG"),
	_T("res\\DiscSpeed_32x32.PNG"),
	_T("res\\MD5 Verifier_32x32.PNG"),
	_T("res\\Home_32x32.PNG"),
	_T("res\\My N_32x32.PNG"),
};


CNGameControl::CNGameControl( void )
{
	m_iTileX = m_iTileY = 0;
	m_bStarted = false;
	m_iScore = 0;
}

CNGameControl::~CNGameControl( void )
{
	for( int i = 0; i < MAX_TILE; i++ )
	{
		delete m_pTile[i];
		m_pTile[i] = NULL;
	}
	delete[] m_pField;
	m_pField = NULL;
}

BOOL CNGameControl::Create( const RECT& rect, CWnd* pParentWnd, UINT nID)
{
	for( int i = 0; i < MAX_TILE; i++ )
	{
		m_pTile[i] = new CImage;
		m_pTile[i]->Load( g_strTilePath[i] );
	}

	CRect rcSize( rect );

	m_pField = new CNGameField( rcSize.Width() / TILE_WIDTH, rcSize.Height() / TILE_HEIGHT, MAX_TILE );
	m_pField->InitRandom( 43222 );
	m_iScore = 0;

	BOOL bResult = CButton::Create(_T(""), WS_CHILD | WS_VISIBLE | BS_OWNERDRAW | BS_USERBUTTON, rect, pParentWnd, nID);
	m_fontScore.CreatePointFont( 160, _T("Arial") ); 

	SetTimer( (UINT_PTR)this, 50, NULL );

	return bResult;
}

void CNGameControl::DrawItem(LPDRAWITEMSTRUCT lpDrawItemStruct )
{
	CRect rcClient;
	GetClientRect( &rcClient );

	CDC dc;
	dc.Attach( lpDrawItemStruct->hDC );

	CDC dcMem;
    dcMem.CreateCompatibleDC( &dc );

	CBitmap bmpMem;
	bmpMem.CreateCompatibleBitmap( &dc, rcClient.Width(), rcClient.Height() );
	dcMem.SelectObject( &bmpMem );

	CBrush brush( RGB( 0, 0, 0 ) );
	dcMem.FillRect( &rcClient, &brush );
	
	/*
	for( int y = 0; y < m_pField->GetHeight(); y++ )
	{
		for( int x = 0; x < m_pField->GetWidth(); x++ )
		{
			CFieldPos* pPos = m_pField->GetField( x, y );
			int iTile = pPos->m_iValue;
			if( iTile < 0 || pPos->m_iXOffset != 0 || pPos->m_iYOffset != 0 )
			{
				CRect rcTile( x * TILE_WIDTH, y * TILE_HEIGHT, x * TILE_WIDTH + TILE_WIDTH, y * TILE_HEIGHT + TILE_HEIGHT );
				dc.FillRect( &rcTile, &brush );
			}
		}
	}
	*/

	dcMem.SelectObject( &m_fontScore );
	dcMem.SetTextColor( RGB( 255, 255, 255 ) );
	dcMem.SetBkMode( TRANSPARENT );
	
	for( int y = 0; y < m_pField->GetHeight(); y++ )
	{
		for( int x = 0; x < m_pField->GetWidth(); x++ )
		{
			CFieldPos* pPos = m_pField->GetField( x, y );
			int iTile = pPos->m_iValue;
			if( iTile >= 0 )			
				m_pTile[iTile]->BitBlt( dcMem.m_hDC, x * TILE_WIDTH + pPos->m_iXOffset, y * TILE_HEIGHT + pPos->m_iYOffset );
			
			/*//
			CString strValue;
			strValue.Format( _T("%d"), pPos->m_iValue );
			CRect rcTile( x * TILE_WIDTH, y * TILE_HEIGHT, x * TILE_WIDTH + TILE_WIDTH, y * TILE_HEIGHT + TILE_HEIGHT );
			dc.DrawText( strValue, &rcTile, DT_NOCLIP );
			//*/
		}
	}

	CString strScore;
	strScore.Format( _T("%05d"), m_iScore );
	CRect rcScore = rcClient;
	rcScore.OffsetRect( -6, -2 );
	dcMem.SetTextColor( RGB( 0, 0, 0 ) );
	dcMem.DrawText( strScore, &rcScore, DT_RIGHT );
	rcScore.OffsetRect( 4, 4 );
	dcMem.DrawText( strScore, &rcScore, DT_RIGHT );
	rcScore.OffsetRect( -2, -2 );
	dcMem.SetTextColor( RGB( 255, 255, 255 ) );
	dcMem.DrawText( strScore, &rcScore, DT_RIGHT );

	dc.BitBlt( 0, 0, rcClient.Width(), rcClient.Height(), &dcMem, rcClient.left, rcClient.top, SRCCOPY );

	dc.Detach();
}

BEGIN_MESSAGE_MAP(CNGameControl, CButton)
	ON_WM_TIMER()
	ON_WM_ERASEBKGND()
	ON_WM_LBUTTONDOWN()
	ON_WM_DESTROY()
	ON_WM_LBUTTONUP()
END_MESSAGE_MAP()

void CNGameControl::OnTimer(UINT_PTR nIDEvent)
{
	if( m_pField )
	{
		m_iScore += m_pField->DoGame();
		Invalidate();
	}
	CButton::OnTimer(nIDEvent);
}

BOOL CNGameControl::OnEraseBkgnd(CDC* pDC)
{
	return TRUE;
}

void CNGameControl::OnLButtonDown(UINT nFlags, CPoint point)
{
	if( !m_bStarted )
	{
		m_bStarted = true;
		m_iTileX = point.x / TILE_WIDTH;
		m_iTileY = point.y / TILE_HEIGHT;
	}
	else
	{
		m_bStarted = false;
		int x2 = point.x / TILE_WIDTH;
		int y2 = point.y / TILE_HEIGHT;
					
		m_pField->Flip( m_iTileX, m_iTileY, x2, y2 );
	}
	
	CButton::OnLButtonDown(nFlags, point);
}

void CNGameControl::OnDestroy()
{
	CButton::OnDestroy();

	KillTimer( (UINT_PTR)this );
}

void CNGameControl::OnLButtonUp(UINT nFlags, CPoint point)
{
	int x2 = point.x / TILE_WIDTH;
	int y2 = point.y / TILE_HEIGHT;
	
	if( m_bStarted && (x2 != m_iTileX || y2 != m_iTileY) )
	{
		m_bStarted = false;
		m_pField->Flip( m_iTileX, m_iTileY, x2, y2 );
	}

	CButton::OnLButtonUp(nFlags, point);
}
