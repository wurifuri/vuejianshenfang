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

import com.entity.HuiyuanxukaEntity;
import com.entity.view.HuiyuanxukaView;

import com.service.HuiyuanxukaService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MD5Util;
import com.utils.MPUtil;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 会员续卡
 * 后端接口
 * @author 
 * @email 
 * @date 2023-04-07 08:13:51
 */
@RestController
@RequestMapping("/huiyuanxuka")
public class HuiyuanxukaController {
    @Autowired
    private HuiyuanxukaService huiyuanxukaService;


    


    /**
     * 后端列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,HuiyuanxukaEntity huiyuanxuka,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("huiyuan")) {
			huiyuanxuka.setZhanghao((String)request.getSession().getAttribute("username"));
		}
        EntityWrapper<HuiyuanxukaEntity> ew = new EntityWrapper<HuiyuanxukaEntity>();

		PageUtils page = huiyuanxukaService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, huiyuanxuka), params), params));

        return R.ok().put("data", page);
    }
    
    /**
     * 前端列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,HuiyuanxukaEntity huiyuanxuka, 
		HttpServletRequest request){
        EntityWrapper<HuiyuanxukaEntity> ew = new EntityWrapper<HuiyuanxukaEntity>();

		PageUtils page = huiyuanxukaService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, huiyuanxuka), params), params));
        return R.ok().put("data", page);
    }

	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( HuiyuanxukaEntity huiyuanxuka){
       	EntityWrapper<HuiyuanxukaEntity> ew = new EntityWrapper<HuiyuanxukaEntity>();
      	ew.allEq(MPUtil.allEQMapPre( huiyuanxuka, "huiyuanxuka")); 
        return R.ok().put("data", huiyuanxukaService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(HuiyuanxukaEntity huiyuanxuka){
        EntityWrapper< HuiyuanxukaEntity> ew = new EntityWrapper< HuiyuanxukaEntity>();
 		ew.allEq(MPUtil.allEQMapPre( huiyuanxuka, "huiyuanxuka")); 
		HuiyuanxukaView huiyuanxukaView =  huiyuanxukaService.selectView(ew);
		return R.ok("查询会员续卡成功").put("data", huiyuanxukaView);
    }
	
    /**
     * 后端详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        HuiyuanxukaEntity huiyuanxuka = huiyuanxukaService.selectById(id);
        return R.ok().put("data", huiyuanxuka);
    }

    /**
     * 前端详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        HuiyuanxukaEntity huiyuanxuka = huiyuanxukaService.selectById(id);
        return R.ok().put("data", huiyuanxuka);
    }
    



    /**
     * 后端保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody HuiyuanxukaEntity huiyuanxuka, HttpServletRequest request){
    	huiyuanxuka.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(huiyuanxuka);
        huiyuanxukaService.insert(huiyuanxuka);
        return R.ok();
    }
    
    /**
     * 前端保存
     */
	@IgnoreAuth
    @RequestMapping("/add")
    public R add(@RequestBody HuiyuanxukaEntity huiyuanxuka, HttpServletRequest request){
    	huiyuanxuka.setId(new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue());
    	//ValidatorUtils.validateEntity(huiyuanxuka);
        huiyuanxukaService.insert(huiyuanxuka);
        return R.ok();
    }



    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody HuiyuanxukaEntity huiyuanxuka, HttpServletRequest request){
        //ValidatorUtils.validateEntity(huiyuanxuka);
        huiyuanxukaService.updateById(huiyuanxuka);//全部更新
        return R.ok();
    }


    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        huiyuanxukaService.deleteBatchIds(Arrays.asList(ids));
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
		
		Wrapper<HuiyuanxukaEntity> wrapper = new EntityWrapper<HuiyuanxukaEntity>();
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

		int count = huiyuanxukaService.selectCount(wrapper);
		return R.ok().put("count", count);
	}
	









}
