package com.neusoft.services.impl.EA;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class EA0102ServicesImpl extends JdbcServicesSupport 
{
	/**
	 * 查询出对应账号密码的员工信息以及角色信息,以供登录验证与状态信息保存
	 * @return
	 * @throws Exception
	 */
	public Map<String,String> checkLogin() throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select x.ssa401,x.aae101,y.ssa201,z.aae102,z.aae103")
				.append("  from sa04 x, sa05 y, ae01 z")
				.append(" where x.aae101=z.aae101")
				.append("   and x.ssa401=y.ssa401")
				.append("   and x.ssa405=1")
				.append("   and ssa402=? and ssa404=?")
				;
		Object args[]=
			{
				this.get("ssa402"),
				Tools.getMd5(this.get("ssa404"))
			};
		return this.queryForMap(sql.toString(), args);
	}
	
	/**
	 * 查询角色关联的所有菜单信息
	 * @return
	 * @throws Exception
	 */
	public Map<String, List<Map<String, String>>> getMenu()throws Exception
	{
		Map<String, List<Map<String, String>>> menuMap = new HashMap<>();
		String sql1 = "select ssa201 from sa02 where ssa203=1";
		StringBuilder sql2 = new StringBuilder()
				.append("select y.ssa102,y.ssa103,y.ssa104")
				.append("  from sa03 x,sa01 y")
				.append(" where x.ssa101=y.ssa101")
				.append("   and x.ssa302=1")
				.append("   and y.ssa105=1")
				.append("   and x.ssa201=?")
				;
		List<Map<String, String>> maplist = this.queryForList(sql1);
		for(Map<String,String> map:maplist)
		{
			String ssa201 = map.get("ssa201");
			Object args[]=
				{
					ssa201
				};
			List<Map<String, String>> menus = this.queryForList(sql2.toString(), args);
			menuMap.put(ssa201, menus);
		}
		
		return menuMap;
	}
}
