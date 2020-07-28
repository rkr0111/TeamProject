package com.TeamPro.action;

import javax.servlet.http.*;
import com.TeamPro.dto.ActionForward;

public interface Light_action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
