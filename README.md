# Special_equipment_IoT_exchange-_service

特种设备物联网系统数据交换服务程序

1. 功能介绍：

	本程序实现了国标 GB/T 38656-2020，即《特种设备物联网系统数据交换技术规范》，解决特种设备厂家国标符合性及政府监管要求。
	
	本程序功能包括定时同步设备数据新增、更新、删除操作到上级平台，和对上级平台的查询响应。
	
	本程序能够处理4大类14小类特种设备数据，用户可以根据企业实际情况启用其中的一种或多种，分别是：
	
		电梯设备：
		
			电梯、自动扶梯、自动人行道；
			
		起重机械设备：
		
			桥式起重机、门式起重机、门座式起重机、流动式起重机、塔式起重机、机械式停车设备；
			
		锅炉设备：
		
			蒸汽锅炉、有机热载体锅炉、热水锅炉；
			
		气瓶设备：
		
			气瓶、移动式压力容器。	
			
	本程序包括Windows和Linux两个版本，通过简单配置即可上线，详见下文。

2. 下载压缩包 deose.zip 到服务器，解压缩。

3. 按 special_equipment.sql 文件创建MySQL数据库，可以建立数据库用户并赋予相应访问权限。

4. 修改配置文件 deose.exe.ini 中 [mysql] 节各项数据库设置：

	serverAddress：MySQL访问地址和端口；
	
	name：数据库名，默认是special_equipment；
	
	user：数据库访问账号；
	
	pass：数据库访问密码。
	
5. 数据库初始化：

	表t_area_platform：设置上级平台访问信息，相应区域的设备数据将上传到所在区域的平台。该表中需要至少一条记录。
	
	以下表是设备数据表，在设备数据新增、更新或删除时，写入对应的表中。	
	
		表t_bridge_crane_data：桥式起重机数据。
		
		表t_clsg_boiler_data：热水锅炉数据。
		
		表t_cylinder_data：气瓶设备数据。
		
		表t_elevator_data：电梯数据。
		
		表t_escalator_data：自动扶梯数据。
		
		表t_gantry_crane_data：门座式起重机数据。
		
		表t_mechanical_parking_equipment_data：机械式停车设备数据。
		
		表t_mobile_crane_data：流动式起重机数据。
		
		表t_mobile_pressure_vessel_data：移动式压力容器数据。
		
		表t_moving_sidewalk_data：自动人行道数据。
		
		表t_portal_crane_data：门式起重机数据。
		
		表t_steam_boiler_data：蒸汽锅炉数据。
		
		表t_tower_crane_data：塔式起重机数据。
		
		表t_ygl_boiler_data：有机热载体锅炉数据。
		
	设备数据表关键字段释义：
	
		字段optype：操作类型，UPLOAD/UPDATE/DELETE 分别表示新增、更新和删除。
		
		字段optime：操作时间，表示写入或更新该条记录的时间，定时上传数据将比较optime和uptime字段，只有未同步的更新才会上传。
		
		字段uptime：同步到上级平台的时间，在该条记录同步完成后自动更新该字段。
		
		字段area_code：地区编号，符合GB/T 2260-2007中地区名称对应的数字代码（如110228代表密云县），与表t_area_platform中的记录相对应。
		
6. 配置文件其它设置：

	[app]节：
	
		httpBindAddress：本服务程序绑定的网络地址和端口。
		
		enableHttps：是否启用HTTPS。
		
		certPath：若启用了HTTPS，证书文件路径。
		
		keyPath：若启用了HTTPS，KEY文件路径。
		
		reportWeekdays：上报周期，0123456分别表示周日周一周二周三周四周五周六，可以设置为一天或多天。
		
		reportTimer：定时上报的时间，HH:mm格式，表示小时和分钟。
		
		retryTimes：上报失败的重试次数。
		
		retryIntervalSeconds：上报失败重试的间隔秒数。
		
		uploadOnStartup：是否在程序启动时立即上传一次。
		
		logLevel：日志级别，值为 info 时，将在日志文件中保存本服务程序与上级平台的数据交换内容，日志文件保存在当前程序根目录的/logs子目录。
		
	[inc]节：
	
		includeDianTi：true表示包含电梯数据。
		
		includeZiDongFuTi：true表示包含自动扶梯数据。
		
		includeZiDongRenXingDao：true表示包含自动人行道数据。
		
		includeQiaoShiQiZhongJi：true表示包含桥式起重机数据。
		
		includeMenShiQiZhongJi：true表示包含门式起重机数据。
		
		includeLiuDongShiQiZhongJi：true表示包含流动式起重机数据。
		
		includeMenZuoShiQiZhongJi：true表示包含门座式起重机数据。
		
		includeTaShiQiZhongJi：true表示包含塔式起重机数据。
		
		includeJiXieShiTingCheSheBei：true表示包含机械式停车设备数据。
		
		includeZhengQiGuoLu：true表示包含蒸汽锅炉数据。
		
		includeYouJiReZaiTiGuoLu：true表示包含有机热载体锅炉数据。
		
		includeReShuiGuoLu：true表示包含热水锅炉数据。
		
		includeQiPing：true表示包含气瓶设备数据。
		
		includeYiDongShiYaLiRongQi：包含移动式压力容器数据。
		
7. 可选字段设置：

	默认不启用任何可选字段，若需要启用可选字段，则修改相应的设置文件，目录setting中是各字段设置文件；
	
	<basic> 内容不能修改，否则会引起不确定错误；
	
	<optional> 中各 <field> 除 enabled 属性外，其它内容也不能修改，enabled 为 true 时表示启用该可选字段，为 false 表示不启用该可选字段。
	
	bridge_crane.xml：桥式起重机设备字段设置。
	
	clsg_boiler.xml：热水锅炉设备字段设置。
	
	cylinder.xml：气瓶设备字段设置。
	
	elevator.xml：电梯设备字段设置。
	
	escalator.xml：自动扶梯设备字段设置。
	
	gantry_crane.xml：门座式起重机设备字段设置。
	
	mechanical_parking_equipment.xml：机械式停车设备字段设置。
	
	mobile_crane.xml：流动式起重机设备字段设置。
	
	mobile_pressure_vessel.xml：移动式压力容器设备字段设置。
	
	moving_sidewalk.xml：自动人行道设备字段设置。
	
	portal_crane.xml：门式起重机设备字段设置。
	
	steam_boiler.xml：蒸汽锅炉设备字段设置。
	
	tower_crane.xml：塔式起重机设备字段设置。
	
	ygl_boiler.xml：有机热载体锅炉设备字段设置。
	
8. 将deose.exe设置为开机自启动。




