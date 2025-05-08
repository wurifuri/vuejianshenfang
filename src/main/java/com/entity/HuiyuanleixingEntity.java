package com.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import java.lang.reflect.InvocationTargetException;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.beanutils.BeanUtils;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.enums.FieldFill;
import com.baomidou.mybatisplus.enums.IdType;


/**
 * 会员类型
 * 数据库通用操作实体类（普通增删改查）
 * @author 
 * @email 
 * @date 2023-04-07 08:13:51
 */
@TableName("huiyuanleixing")
public class HuiyuanleixingEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;


	public HuiyuanleixingEntity() {
		
	}
	
	public HuiyuanleixingEntity(T t) {
		try {
			BeanUtils.copyProperties(this, t);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/**
	 * 主键id
	 */
	@TableId
	private Long id;
	/**
	 * 会员卡类型
	 */
					
	private String huiyuankaleixing;
	
	/**
	 * 有效天数
	 */
					
	private Integer youxiaotianshu;
	
	/**
	 * 售价
	 */
					
	private Float jine;
	
	/**
	 * 详情
	 */
					
	private String xiangqing;
	
	
	@JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
	@DateTimeFormat
	private Date addtime;

	public Date getAddtime() {
		return addtime;
	}
	public void setAddtime(Date addtime) {
		this.addtime = addtime;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 设置：会员卡类型
	 */
	public void setHuiyuankaleixing(String huiyuankaleixing) {
		this.huiyuankaleixing = huiyuankaleixing;
	}
	/**
	 * 获取：会员卡类型
	 */
	public String getHuiyuankaleixing() {
		return huiyuankaleixing;
	}
	/**
	 * 设置：有效天数
	 */
	public void setYouxiaotianshu(Integer youxiaotianshu) {
		this.youxiaotianshu = youxiaotianshu;
	}
	/**
	 * 获取：有效天数
	 */
	public Integer getYouxiaotianshu() {
		return youxiaotianshu;
	}
	/**
	 * 设置：售价
	 */
	public void setJine(Float jine) {
		this.jine = jine;
	}
	/**
	 * 获取：售价
	 */
	public Float getJine() {
		return jine;
	}
	/**
	 * 设置：详情
	 */
	public void setXiangqing(String xiangqing) {
		this.xiangqing = xiangqing;
	}
	/**
	 * 获取：详情
	 */
	public String getXiangqing() {
		return xiangqing;
	}

}
