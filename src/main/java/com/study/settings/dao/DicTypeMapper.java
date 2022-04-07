package com.study.settings.dao;

import com.study.settings.model.DicType;
import com.study.settings.model.DicTypeExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DicTypeMapper {
    long countByExample(DicTypeExample example);

    int deleteByExample(DicTypeExample example);

    int deleteByPrimaryKey(String code);

    int insert(DicType record);

    int insertSelective(DicType record);

    List<DicType> selectByExample(DicTypeExample example);

    DicType selectByPrimaryKey(String code);

    int updateByExampleSelective(@Param("record") DicType record, @Param("example") DicTypeExample example);

    int updateByExample(@Param("record") DicType record, @Param("example") DicTypeExample example);

    int updateByPrimaryKeySelective(DicType record);

    int updateByPrimaryKey(DicType record);
}