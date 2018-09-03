package com.github.yard01.liferay7.portlet.treeselector.controller;

import java.io.IOException;
import java.net.MalformedURLException;

import javax.portlet.PortletRequest;
import javax.servlet.http.HttpServletRequest;

import com.github.yard01.liferay7.portlet.treeselector.model.TreeselectorModel;
import com.github.yard01.liferay7.portlet.treeselector.utils.TreeselectorUtils;
import com.liferay.portal.kernel.json.JSONArray;
import com.liferay.portal.kernel.json.JSONException;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.PortalUtil;

public class TreeselectorController {
	public static final String CONTROLLER_ATTR = "controller";
	public static final String BOOK_CODE_PARAMETER = "code";
	
	public static final String JSON_TREE_ID = "id";
	public static final String JSON_TREE_LABEL = "label";
	public static final String JSON_TREE_CHILDREN = "children";
	
	private TreeselectorModel model;

	public static TreeselectorController getInstance(PortletRequest request) {
		return getInstance(PortalUtil.getHttpServletRequest(request));
	}	
	
	
	public static TreeselectorController getInstance(HttpServletRequest request) {
		TreeselectorController instance = (TreeselectorController) TreeselectorUtils.getSessionAttribute(request, CONTROLLER_ATTR);
		if (instance == null) {
			instance = new TreeselectorController();
			TreeselectorUtils.setSessionAttribute(request, CONTROLLER_ATTR, instance);
		}
		return instance;
		
	}
	
	public TreeselectorController () {
		model = new TreeselectorModel();
	}
	
	public String getBookName() {
		return model.bookName;
	}

	public String getBookCode() {
		return model.bookCode;
	}
	
	public void setBookName(String bookName) {
		model.bookName = bookName;
	}

	public void setBookCode(String bookCode) {
		model.bookCode = bookCode;
	}
	
	public static JSONArray getTreeData(HttpServletRequest request) {
		
	
		try {
				return JSONFactoryUtil.createJSONArray(TreeselectorUtils.loadResourceAsString("/data/tree_data.txt", request.getServletContext(), "UTF-8"));

		} catch (JSONException e) {
			e.printStackTrace();			
				
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}	
	
	private static String findName(String id, JSONArray array) {
		String result = "";
		for (int i = 0; i < array.length(); i++) {
			JSONObject row = array.getJSONObject(i);
			if (row.getString(JSON_TREE_ID).equals(id)) 
				return row.getString(JSON_TREE_LABEL);
			JSONArray children = row.getJSONArray(JSON_TREE_CHILDREN);
			if (children != null) {
				result = findName(id, children);
				if (!result.equals("")) return result;
			}
		}
		return result;
	}
	
	protected static String getBookNameByCode(HttpServletRequest request, String code) {
		//JSONArray bookArray = getTreeData(request);
		return findName(code,  getTreeData(request));
	}


	public void readParameters(PortletRequest request) {
		this.model.bookCode = ParamUtil.getString(request, BOOK_CODE_PARAMETER, "");
		this.model.bookName = getBookNameByCode(PortalUtil.getHttpServletRequest(request), this.model.bookCode);		
	}
}
