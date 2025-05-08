package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.HuiyuanxukaDao;
import com.entity.HuiyuanxukaEntity;
import com.service.HuiyuanxukaService;
import com.entity.vo.HuiyuanxukaVO;
import com.entity.view.HuiyuanxukaView;

@Service("huiyuanxukaService")
public class HuiyuanxukaServiceImpl extends ServiceImpl<HuiyuanxukaDao, HuiyuanxukaEntity> implements HuiyuanxukaService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<HuiyuanxukaEntity> page = this.selectPage(
                new Query<HuiyuanxukaEntity>(params).getPage(),
                new EntityWrapper<HuiyuanxukaEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<HuiyuanxukaEntity> wrapper) {
		  Page<HuiyuanxukaView> page =new Query<HuiyuanxukaView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<HuiyuanxukaVO> selectListVO(Wrapper<HuiyuanxukaEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public HuiyuanxukaVO selectVO(Wrapper<HuiyuanxukaEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<HuiyuanxukaView> selectListView(Wrapper<HuiyuanxukaEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public HuiyuanxukaView selectView(Wrapper<HuiyuanxukaEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
