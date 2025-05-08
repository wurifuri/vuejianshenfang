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


import com.dao.HuiyuanbankaDao;
import com.entity.HuiyuanbankaEntity;
import com.service.HuiyuanbankaService;
import com.entity.vo.HuiyuanbankaVO;
import com.entity.view.HuiyuanbankaView;

@Service("huiyuanbankaService")
public class HuiyuanbankaServiceImpl extends ServiceImpl<HuiyuanbankaDao, HuiyuanbankaEntity> implements HuiyuanbankaService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<HuiyuanbankaEntity> page = this.selectPage(
                new Query<HuiyuanbankaEntity>(params).getPage(),
                new EntityWrapper<HuiyuanbankaEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<HuiyuanbankaEntity> wrapper) {
		  Page<HuiyuanbankaView> page =new Query<HuiyuanbankaView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    
    @Override
	public List<HuiyuanbankaVO> selectListVO(Wrapper<HuiyuanbankaEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public HuiyuanbankaVO selectVO(Wrapper<HuiyuanbankaEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<HuiyuanbankaView> selectListView(Wrapper<HuiyuanbankaEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public HuiyuanbankaView selectView(Wrapper<HuiyuanbankaEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
