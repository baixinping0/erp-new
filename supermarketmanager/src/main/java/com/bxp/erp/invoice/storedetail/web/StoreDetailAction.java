package com.bxp.erp.invoice.storedetail.web;

import com.bxp.erp.invoice.goods.business.ebi.GoodsEbi;
import com.bxp.erp.invoice.goods.vo.GoodsModel;
import com.bxp.erp.invoice.store.business.ebi.StoreEbi;
import com.bxp.erp.invoice.store.vo.StoreModel;
import com.bxp.erp.invoice.storedetail.business.ebi.StoreDetailEbi;
import com.bxp.erp.invoice.storedetail.vo.StoreDetailModel;
import com.bxp.erp.invoice.storedetail.vo.StoreDetailQueryModel;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

public class StoreDetailAction extends ActionSupport{
	private StoreDetailEbi storeDetailEbi;
	private GoodsEbi goodsEbi;
	private StoreEbi storeEbi;

	public void setGoodsEbi(GoodsEbi goodsEbi) {
		this.goodsEbi = goodsEbi;
	}

	public void setStoreEbi(StoreEbi storeEbi) {
		this.storeEbi = storeEbi;
	}

	public StoreDetailQueryModel storeDetailq = new StoreDetailQueryModel();

	public void setStoreDetailEbi(StoreDetailEbi storeDetailEbi) {
		this.storeDetailEbi = storeDetailEbi;
	}

	public  String list(){
		List<StoreDetailModel> storeDetailList = storeDetailEbi.getAll(storeDetailq);
		ActionContext.getContext().put("storeDetailList", storeDetailList);

		List<GoodsModel> goodsList = goodsEbi.getAll();
		ActionContext.getContext().put("goodsList", goodsList);

		List<StoreModel> storeList = storeEbi.getAll();
		ActionContext.getContext().put("storeList", storeList);
		return "list";

	}
}
