package com.study.workbench.dao;

import com.study.workbench.model.Contacts;
import com.study.workbench.model.ContactsExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ContactsMapper {
    long countByExample(ContactsExample example);

    int deleteByExample(ContactsExample example);

    int deleteByPrimaryKey(String id);

    int insert(Contacts record);

    int insertSelective(Contacts record);

    List<Contacts> selectByExample(ContactsExample example);

    Contacts selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Contacts record, @Param("example") ContactsExample example);

    int updateByExample(@Param("record") Contacts record, @Param("example") ContactsExample example);

    int updateByPrimaryKeySelective(Contacts record);

    int updateByPrimaryKey(Contacts record);

    List<String> queryIdsByName(String name);

    String queryNameById(String name);

    List<Contacts> queryByName(String name);
}