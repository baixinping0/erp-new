package com.bxp.erp.invoice.storedetail.business.ebi;

import java.util.List;

import com.bxp.erp.invoice.storedetail.vo.StoreDetailModel;
import com.bxp.erp.invoice.storedetail.vo.StoreDetailQueryModel;
import org.springframework.transaction.annotation.Transactional;

@Transactional
public interface StoreDetailEbi {

	public List<Object[]> getWarnInfo();

    List<StoreDetailModel> getAll(StoreDetailQueryModel storeDetailq);
}
