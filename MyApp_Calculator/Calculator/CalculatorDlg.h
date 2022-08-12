
// CalculatorDlg.h : 头文件

#pragma once

//运算符
enum CALCULATOR_FLAG{
	FLAG_JIA = 0,
	FLAG_JIAN,
	FLAG_CHENG,
	FLAG_CHU,
	FLAG_PINGFANG,
	FLAG_KAIFANG,
};
class CCalculatorDlg : public CDialogEx
{
public:
	CCalculatorDlg(CWnd* pParent = NULL);

	enum { IDD = IDD_CALCULATOR_DIALOG };

	void SaveFirstValue();		//保存第一个输入值
	void Calculator();			//计算
public:
	afx_msg void OnButtonBack();
	afx_msg void OnButtonClear();
	afx_msg void OnButtonAbout();
	afx_msg void OnButton1();
	afx_msg void OnButton2();
	afx_msg void OnButton3();
	afx_msg void OnButton4();
	afx_msg void OnButton5();
	afx_msg void OnButton6();
	afx_msg void OnButton7();
	afx_msg void OnButton8();
	afx_msg void OnButton9();
	afx_msg void OnButton0();
	afx_msg void OnButtonDian();
	afx_msg void OnButtonChu();
	afx_msg void OnButtonCheng();
	afx_msg void OnButtonJian();
	afx_msg void OnButtonJia();
	afx_msg void OnButtonPingfang();
	afx_msg void OnButtonKaifang();
	afx_msg void OnButtonDeng();
protected:
	HICON m_hIcon;

	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV 支持
	virtual BOOL OnInitDialog();

	DECLARE_MESSAGE_MAP()

private:
	//编辑框内的字符串
	CString mStr;		
	//输入的2个值  
	double mNum1;
	double mNum2;
	//运算符号
	CALCULATOR_FLAG mFlag;
};
