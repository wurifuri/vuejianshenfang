package com.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Map;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.utils.ValidatorUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.HuiyuanbankaEntity;
import com.entity.view.HuiyuanbankaView;

import com.service.HuiyuanbankaService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MD5Util;
import com.utils.MPUtil;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 会员办卡
 * 后端接口
 * @author 
 * @email 
 * @date 2023-04-07 08:13:51
 */
@RestController
@RequestMapping("/huiyuanbanka")
public class HuiyuanbankaController {
    @Autowired
    private HuiyuanbankaService huiyuanbankaService;


    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,HuiyuanbankaEntity huiyuanbanka,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("huiyuan")) {
			huiyuanbanka.setZhanghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<HuiyuanbankaEntity> ew = new EntityWrapper<HuiyuanbankaEntity>();

		PageUtils page = huiyuanbankaService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, huiyuanbanka), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,HuiyuanbankaEntity huiyuanbanka, 
		HttpServletRequest request){
        EntityWrapper<HuiyuanbankaEntity> ew = new EntityWrapper<HuiyuanbankaEntity>();

		PageUtils page = huiyuanbankaService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, huiyuanbanka), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( HuiyuanbankaEntity huiyuanbanka){
       	EntityWrapper<HuiyuanbankaEntity> ew = new EntityWrapper<HuiyuanbankaEntity>();
      	ew.allEq(MPUtil.allEQMapPre( huiyuanbanka, "huiyuanbanka")); 
        return R.ok().put("data", huiyuanbankaService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(HuiyuanbankaEntity huiyuanbanka){
        EntityWrapper< HuiyuanbankaEntity> ew = new EntityWrapper< HuiyuanbankaEntity>();
 		ew.allEq(MPUtil.allEQMapPre( huiyuanbanka, "huiyuanbanka")); 
		HuiyuanbankaView huiyuanbankaView =  huiyuanbankaService.selectView(ew);
		return R.ok("查询会员办卡成功").put("data", huiyuanbankaView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        HuiyuanbankaEntity huiyuanbanka = huiyuanbankaService.selectById(id);
        return R.ok().put("data", huiyuanbanka);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        HuiyuanbankaEntity huiyuanbanka = huiyuanbankaService.selectById(id);
        return R.ok().put("data", huiyuanbanka);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody HuiyuanbankaEntity huiyuanbanka, HttpServletRequest request){
    	huiyuanbanka.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(huiyuanbanka);
        huiyuanbankaService.insert(huiyuanbanka);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
	@IgnoreAuth
    @RequestMapping("/add")
    public R add(@RequestBody HuiyuanbankaEntity huiyuanbanka, HttpServletRequest request){
    	huiyuanbanka.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(huiyuanbanka);
        huiyuanbankaService.insert(huiyuanbanka);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody HuiyuanbankaEntity huiyuanbanka, HttpServletRequest request){
        //ValidatorUtils.validateEntity(huiyuanbanka);
        huiyuanbankaService.updateById(huiyuanbanka);//全部更新
        return R.ok();
    }


    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        huiyuanbankaService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
    /**
     * 提醒接口
     */
	@RequestMapping("/remind/{columnName}/{type}")
	public R remindCount(@PathVariable("columnName") String columnName, HttpServletRequest request, 
						 @PathVariable("type") String type,@RequestParam Map<String, Object> map) {
		map.put("column", columnName);
		map.put("type", type);
		
		if(type.equals("2")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			Date remindStartDate = null;
			Date remindEndDate = null;
			if(map.get("remindstart")!=null) {
				Integer remindStart = Integer.parseInt(map.get("remindstart").toString());
				c.setTime(new Date()); 
				c.add(Calendar.DAY_OF_MONTH,remindStart);
				remindStartDate = c.getTime();
				map.put("remindstart", sdf.format(remindStartDate));
			}
			if(map.get("remindend")!=null) {
				Integer remindEnd = Integer.parseInt(map.get("remindend").toString());
				c.setTime(new Date());
				c.add(Calendar.DAY_OF_MONTH,remindEnd);
				remindEndDate = c.getTime();
				map.put("remindend", sdf.format(remindEndDate));
			}
		}
		
		Wrapper<HuiyuanbankaEntity> wrapper = new EntityWrapper<HuiyuanbankaEntity>();
		if(map.get("remindstart")!=null) {
			wrapper.ge(columnName, map.get("remindstart"));
		}
		if(map.get("remindend")!=null) {
			wrapper.le(columnName, map.get("remindend"));
		}

		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("huiyuan")) {
			wrapper.eq("zhanghao", (String)request.getSession().getAttribute("username"));
		}

		int count = huiyuanbankaService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	









}
