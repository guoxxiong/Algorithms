
// CalculatorDlg.cpp : ʵ���ļ�
//

#include "stdafx.h"
#include "Calculator.h"
#include "CalculatorDlg.h"
#include "afxdialogex.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// ����Ӧ�ó��򡰹��ڡ��˵���� CAboutDlg �Ի���

class CAboutDlg : public CDialogEx
{
public:
	CAboutDlg();

// �Ի�������
	enum { IDD = IDD_ABOUTBOX };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);    // DDX/DDV ֧��

// ʵ��
protected:
	DECLARE_MESSAGE_MAP()
};

CAboutDlg::CAboutDlg() : CDialogEx(CAboutDlg::IDD)
{
}

void CAboutDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
}

BEGIN_MESSAGE_MAP(CAboutDlg, CDialogEx)
END_MESSAGE_MAP()


// CCalculatorDlg �Ի���

CCalculatorDlg::CCalculatorDlg(CWnd* pParent /*=NULL*/)
	: CDialogEx(CCalculatorDlg::IDD, pParent)
	, mStr(_T(""))
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CCalculatorDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialogEx::DoDataExchange(pDX);
	DDX_Text(pDX, IDC_EDIT1, mStr);
}

BEGIN_MESSAGE_MAP(CCalculatorDlg, CDialogEx)
	ON_WM_SYSCOMMAND()
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()

	ON_BN_CLICKED(IDC_BUTTON_BACK, &CCalculatorDlg::OnButtonBack)
	ON_BN_CLICKED(IDC_BUTTON_CLEAR, &CCalculatorDlg::OnButtonClear)
	ON_BN_CLICKED(IDC_BUTTON_ABOUT, &CCalculatorDlg::OnButtonAbout)
	ON_BN_CLICKED(IDC_BUTTON1, &CCalculatorDlg::OnButton1)
	ON_BN_CLICKED(IDC_BUTTON2, &CCalculatorDlg::OnButton2)
	ON_BN_CLICKED(IDC_BUTTON3, &CCalculatorDlg::OnButton3)
	ON_BN_CLICKED(IDC_BUTTON4, &CCalculatorDlg::OnButton4)
	ON_BN_CLICKED(IDC_BUTTON5, &CCalculatorDlg::OnButton5)
	ON_BN_CLICKED(IDC_BUTTON6, &CCalculatorDlg::OnButton6)
	ON_BN_CLICKED(IDC_BUTTON7, &CCalculatorDlg::OnButton7)
	ON_BN_CLICKED(IDC_BUTTON8, &CCalculatorDlg::OnButton8)
	ON_BN_CLICKED(IDC_BUTTON9, &CCalculatorDlg::OnButton9)
	ON_BN_CLICKED(IDC_BUTTON0, &CCalculatorDlg::OnButton0)
	ON_BN_CLICKED(IDC_BUTTON_DIAN, &CCalculatorDlg::OnButtonDian)
	ON_BN_CLICKED(IDC_BUTTON_CHU, &CCalculatorDlg::OnButtonChu)
	ON_BN_CLICKED(IDC_BUTTON_CHENG, &CCalculatorDlg::OnButtonCheng)
	ON_BN_CLICKED(IDC_BUTTON_JIAN, &CCalculatorDlg::OnButtonJian)
	ON_BN_CLICKED(IDC_BUTTON_JIA, &CCalculatorDlg::OnButtonJia)
	ON_BN_CLICKED(IDC_BUTTON_PINGFANG, &CCalculatorDlg::OnButtonPingfang)
	ON_BN_CLICKED(IDC_BUTTON_KAIFANG, &CCalculatorDlg::OnButtonKaifang)
	ON_BN_CLICKED(IDC_BUTTON_DENG, &CCalculatorDlg::OnButtonDeng)
END_MESSAGE_MAP()


// CCalculatorDlg ��Ϣ�������

BOOL CCalculatorDlg::OnInitDialog()
{
	CDialogEx::OnInitDialog();

	ASSERT((IDM_ABOUTBOX & 0xFFF0) == IDM_ABOUTBOX);
	ASSERT(IDM_ABOUTBOX < 0xF000);

	CMenu* pSysMenu = GetSystemMenu(FALSE);
	if (pSysMenu != NULL)
	{
		BOOL bNameValid;
		CString strAboutMenu;
		bNameValid = strAboutMenu.LoadString(IDS_ABOUTBOX);
		ASSERT(bNameValid);
		if (!strAboutMenu.IsEmpty())
		{
			pSysMenu->AppendMenu(MF_SEPARATOR);
			pSysMenu->AppendMenu(MF_STRING, IDM_ABOUTBOX, strAboutMenu);
		}
	}

	SetIcon(m_hIcon, TRUE);			// ���ô�ͼ��
	SetIcon(m_hIcon, FALSE);		// ����Сͼ��

	return TRUE;
}

void CCalculatorDlg::OnButtonBack()
{
	UpdateData(TRUE);
	//�Ƴ����ұ�һ���ַ�  
	if (!mStr.IsEmpty())
	{
		mStr = mStr.Left(mStr.GetLength() - 1);
	}
	UpdateData(FALSE);
}

void CCalculatorDlg::OnButtonClear()
{
	UpdateData(TRUE);
	mStr = L"";
	mNum1 = 0.0f;
	mNum2 = 0.0f;
	mFlag = FLAG_JIA;
	UpdateData(FALSE);
}

void CCalculatorDlg::OnButtonAbout()
{
	CAboutDlg dlg;
	dlg.DoModal();
}

void CCalculatorDlg::OnButton1()
{
	UpdateData(TRUE);
	mStr += L"1";
	UpdateData(FALSE);
}

void CCalculatorDlg::OnButton2()
{
	UpdateData(TRUE);
	mStr += L"2";
	UpdateData(FALSE);
}

void CCalculatorDlg::OnButton3()
{  
	UpdateData(TRUE);
	mStr += L"3";
	UpdateData(FALSE);
}

void CCalculatorDlg::OnButton4()
{
	UpdateData(TRUE);
	mStr += L"4";
	UpdateData(FALSE);
}

void CCalculatorDlg::OnButton5()
{
	UpdateData(TRUE);
	mStr += L"5";
	UpdateData(FALSE);
}

void CCalculatorDlg::OnButton6()
{
	UpdateData(TRUE);
	mStr += L"6";
	UpdateData(FALSE);
}

void CCalculatorDlg::OnButton7()
{
	UpdateData(TRUE);
	mStr += L"7";
	UpdateData(FALSE);
}

void CCalculatorDlg::OnButton8()
{
	UpdateData(TRUE);
	mStr += L"8";
	UpdateData(FALSE);
}

void CCalculatorDlg::OnButton9()
{
	UpdateData(TRUE);
	mStr += L"9";
	UpdateData(FALSE);
}

void CCalculatorDlg::OnButton0()
{
	UpdateData(TRUE);
	mStr += L"0";
	UpdateData(FALSE);
}

//С���㰴ť  
void CCalculatorDlg::OnButtonDian()
{
	UpdateData(TRUE);
	//���û��С���㣬�����һ��С���㣬�������С����ͺ��Դ˴ε�С���㣬��֤���ֻ��1��  
	if (-1 == mStr.Find(L'.'))
	{
		mStr += L".";
	}
	UpdateData(FALSE);
}

//��
void CCalculatorDlg::OnButtonJia()
{
	SaveFirstValue();
	mFlag = FLAG_JIA;

}

//��
void CCalculatorDlg::OnButtonJian()
{
	SaveFirstValue();
	mFlag = FLAG_JIAN;
}

//��
void CCalculatorDlg::OnButtonCheng()
{
	SaveFirstValue();
	mFlag = FLAG_CHENG;
}

//��
void CCalculatorDlg::OnButtonChu()
{ 
	SaveFirstValue();
	mFlag = FLAG_CHU;
}

//ƽ��
void CCalculatorDlg::OnButtonPingfang()
{
	UpdateData(TRUE);
	mNum1 = _wtof(mStr);
	double f = mNum1 * mNum1;
	//�����������ʵ�Ǹ�����,����ʾΪ����
	if (f - int(f) <= 1e-5)
	{
		mStr.Format(L"%d", (int)f);
	}
	else
	{
		mStr.Format(L"%f", f);
	}
	UpdateData(FALSE);

	mNum1 = f;
	mNum2 = 0.0f;
	mFlag = FLAG_PINGFANG;
}

//����
void CCalculatorDlg::OnButtonKaifang()
{
	UpdateData(TRUE);
	mNum1 = _wtof(mStr);
	double f = sqrt(mNum1);
	//�����������ʵ�Ǹ�����,����ʾΪ����
	if (f - int(f) <= 1e-5)
	{
		mStr.Format(L"%d", (int)f);
	}
	else
	{
		mStr.Format(L"%f", f);
	}
	UpdateData(FALSE);

	mNum1 = f;
	mNum2 = 0.0f;
	mFlag = FLAG_KAIFANG;
}

//����
void CCalculatorDlg::OnButtonDeng()
{
	Calculator();
}

//�����һ������ֵ
void CCalculatorDlg::SaveFirstValue()
{
	UpdateData(TRUE);
	mNum1 = _wtof(mStr);
	mStr = L"";
	UpdateData(FALSE);
}

//������
void CCalculatorDlg::Calculator()
{
	UpdateData(TRUE);
	mNum2 = _wtof(mStr);
	double result = 0.0f;
	switch (mFlag)
	{
	case FLAG_JIA:						//��  
		result = mNum1 + mNum2;
		break;
	case FLAG_JIAN:						//�� 
		result = mNum1 - mNum2;
		break;
	case FLAG_CHENG:					//��  
		result = mNum1 * mNum2;
		break;
	case FLAG_CHU:						//��  
		if (mNum2 == 0.0f)
		{
			result = mNum1;
		}
		else
		{
			result = mNum1 / mNum2;
		}
		break;
	case FLAG_PINGFANG:					//ƽ�� 
		result = mNum2 * mNum2;
		break;
	case FLAG_KAIFANG:					//����  
		result = sqrt(mNum2);
		break;
	default:
		break;
	}
	//�����������ʵ�Ǹ�����,����ʾΪ����
	if (result - int(result) <= 1e-5)
	{
		mStr.Format(L"%d", (int)result);
	}
	else
	{
		mStr.Format(L"%f", result);
	}
	UpdateData(FALSE);

	mNum1 = result;
	mNum2 = 0.0f;
}

