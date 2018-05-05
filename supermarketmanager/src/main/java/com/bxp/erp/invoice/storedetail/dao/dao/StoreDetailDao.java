package com.bxp.erp.invoice.storedetail.dao.dao;

import java.util.List;

import com.bxp.erp.invoice.storedetail.vo.StoreDetailModel;
import com.bxp.erp.invoice.storedetail.vo.StoreDetailQueryModel;

public interface StoreDetailDao {

	public StoreDetailModel getBuyStoreAndGoods(Long storeUuid, Long uuid);

	public void save(StoreDetailModel storeDetail);

	public List<Object[]> getWarnInfo();

    List<StoreDetailModel> getAllByQuery(StoreDetailQueryModel storeDetailq);
}
