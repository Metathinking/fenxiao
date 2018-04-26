package com.hu.fenxiao.repository;

import com.hu.fenxiao.domain.TiXianRecord;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface TiXianRecordRepository {

    void create(TiXianRecord tiXianRecord);

    void update(TiXianRecord tiXianRecord);

    List<TiXianRecord> list(Map<String,Object> params);

    TiXianRecord findById(String id);

    int getCount(Map<String,Object> params);

    int getMaxId();

   List<TiXianRecord> listByMemberIdAndStatus(@Param("memberId")int memberId,@Param("status") String status);
}
