package org.kh.campus.grade.controller;


import java.util.List;

import org.kh.campus.grade.domain.Grade;
import org.kh.campus.grade.service.GradeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.nexacro.uiadapter17.spring.core.data.NexacroResult;
import com.nexacro17.xapi.data.DataSet;

@Controller
public class GradeController {
	
	@Autowired
	private GradeService gService;
	
	// 학생 성적 조회
	@RequestMapping(value="/grade/stdGrade.kh", method=RequestMethod.GET)
	public NexacroResult printGradeStudent() {
		int 	nErrorCode = 0;
		String  strErrorMsg = "START";
		NexacroResult result = new NexacroResult();
		int studentNo = 0;
		
		List<Grade> gList = gService.printGradeStudent(studentNo);
		
		result.addDataSet("out_stdGrade", gList);
		result.addVariable("ErrorCode", nErrorCode);
		result.addVariable("ErrorMsg", strErrorMsg);
		
		return result;
	}
	
	// 학생 이의신청 조회
	public NexacroResult printFeedbackStudent() {
		NexacroResult result = new NexacroResult();
		
		return result;
	}
	
	// 학생 이의 신청 등록
	public NexacroResult registerObjection() {
		NexacroResult result = new NexacroResult();
		
		return result;
	}
	
	// 교수 성적 조회
	@RequestMapping(value="/grade/prfGrade.kh", method=RequestMethod.GET)
	public NexacroResult printGradeProfessor() {
		int 	nErrorCode = 0;
		String  strErrorMsg = "START";
		NexacroResult result = new NexacroResult();
		int prfNo = 1;
		
		List<Grade> gList = gService.printGradeProfessor(prfNo);
		
		result.addDataSet("out_stdGrade", gList);
		result.addVariable("ErrorCode", nErrorCode);
		result.addVariable("ErrorMsg", strErrorMsg);
		
		return result;
	}
	
	// 교수 성적 등록, 수정
	public NexacroResult changeGradeProfessor() {
		NexacroResult result = new NexacroResult();
		
		return result;
	}
	
	// 교수 이의신청 조회
	public NexacroResult printFeedbackProfessor() {
		NexacroResult result = new NexacroResult();
		
		return result;
	}
	
	// 교수 피드백 등록 수정 삭제
	public NexacroResult changeFeedbackProfessor() {
		NexacroResult result = new NexacroResult();
		
		return result;
	}
	
	// Dataset value
	public String dsGet(DataSet ds, int rowno, String colid) throws Exception
	{
	    String value;
	    value = ds.getString(rowno, colid);
	    if( value == null )
	        return "";
	    else
	        return value;
	} 
}
