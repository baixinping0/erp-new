package com.bxp.erp.invoice.storedetail.dao.impl;

import java.util.List;

import com.bxp.erp.auth.emp.vo.EmpModel;
import com.bxp.erp.invoice.storedetail.vo.StoreDetailQueryModel;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.bxp.erp.invoice.storedetail.dao.dao.StoreDetailDao;
import com.bxp.erp.invoice.storedetail.vo.StoreDetailModel;

public class StoreDetailImpl extends HibernateDaoSupport implements StoreDetailDao{

	@Override
	public StoreDetailModel getBuyStoreAndGoods(Long storeUuid, Long goodsUuid) {
		String hql = "from StoreDetailModel where store.uuid = ? and goods.uuid = ?";
		List<StoreDetailModel> storeDetailList = this.getHibernateTemplate().find(hql, storeUuid, goodsUuid);
		return storeDetailList.size() > 0 ? storeDetailList.get(0):null;
	}

	@Override
	public void save(StoreDetailModel storeDetail) {
		this.getHibernateTemplate().save(storeDetail);
	}

	@Override
	public List<Object[]> getWarnInfo() {
		//使用sql进行查询
		
		String sql = "select g.name,g.minNum > sum(sd.num) min,g.maxNum < sum(sd.num) max from tbl_storeDetail sd, tbl_goods g where  g.uuid = sd.goodsUuid  group by g.uuid";
		SessionFactory sf = this.getHibernateTemplate().getSessionFactory();
		Session session = sf.getCurrentSession();
		SQLQuery sq = session.createSQLQuery(sql);
		return sq.list();
	}

	@Override
	public List<StoreDetailModel> getAllByQuery(StoreDetailQueryModel storeDetailq) {
		DetachedCriteria criteria = DetachedCriteria.forClass(StoreDetailModel.class);
		if (storeDetailq.getStore() != null && storeDetailq.getStore().getUuid() != null
				&& storeDetailq.getStore().getUuid() != -1) {
			/*
			 * 通过uuid进行查询的时候，匹配有两种方式
			 */
			// 1、直接使用对象进行查询，此时默认比较的是对象的uuid(推荐使用)
			criteria.add(Restrictions.eq("store", storeDetailq.getStore()));
			// 2、使用uuid进行查询，匹配使用 dep.uuid,此种方式仅限对id进行匹配
			// criteria.add(Restrictions.eq("dep.uuid",
			// empq.getDep().getUuid()));
		}
		if (storeDetailq.getGoods() != null && storeDetailq.getGoods().getUuid() != null
				&& storeDetailq.getGoods().getUuid() != -1) {
			/*
			 * 通过uuid进行查询的时候，匹配有两种方式
			 */
			// 1、直接使用对象进行查询，此时默认比较的是对象的uuid(推荐使用)
			criteria.add(Restrictions.eq("goods", storeDetailq.getGoods()));
			// 2、使用uuid进行查询，匹配使用 dep.uuid,此种方式仅限对id进行匹配
			// criteria.add(Restrictions.eq("dep.uuid",
			// empq.getDep().getUuid()));
		}
		return this.getHibernateTemplate().findByCriteria(criteria);
	}

}
