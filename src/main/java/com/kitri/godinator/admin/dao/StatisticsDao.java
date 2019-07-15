package com.kitri.godinator.admin.dao;

public interface StatisticsDao {
	void addCnt(String user);
	void enrollVisit(String id);
	void addUserCnt(String StaticId);
}
