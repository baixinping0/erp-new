package com.bxp.erp.invoice.storedetail.business.ebo;

import java.util.List;

import com.bxp.erp.invoice.storedetail.business.ebi.StoreDetailEbi;
import com.bxp.erp.invoice.storedetail.dao.dao.StoreDetailDao;
import com.bxp.erp.invoice.storedetail.vo.StoreDetailModel;
import com.bxp.erp.invoice.storedetail.vo.StoreDetailQueryModel;

public class StoreDetailEbo implements StoreDetailEbi {

	private StoreDetailDao storeDetailDao;

	public void setStoreDetailDao(StoreDetailDao storeDetailDao) {
		this.storeDetailDao = storeDetailDao;
	}

	@Override
	public List<Object[]> getWarnInfo() {
		// TODO Auto-generated method stub
		return storeDetailDao.getWarnInfo();
	}

	@Override
	public List<StoreDetailModel> getAll(StoreDetailQueryModel storeDetailq) {
		return storeDetailDao.getAllByQuery(storeDetailq);
	}

}
