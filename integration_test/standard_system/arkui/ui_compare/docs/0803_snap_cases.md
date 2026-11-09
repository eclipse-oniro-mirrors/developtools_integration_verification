# 0803 适合截图对比（Snap）

合计 **142** 条（自 0803 xlsx 自动分流，可人工调整）。

| 编号 | 名称 | 描述组 |
|------|------|--------|
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_PARALLELIZATION_0080` | 多线程创建LoadingProgress，调用contentModifier | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_DC_0030_677` | 压力测试1个DC容器内加载多个不同的组件，设置组件属性，预期属性功能正常切换 | 组件2组 |
| `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0040` | LoadingProgress组件自身设置enableLoading为false、在contentModifier中设置enableLoading为true | 组件2组 |
| `SUB_ACE_UI_COMPONENT_INFOMATION_LOADPROGRESS_BUILDER_0060` | LoadingProgress组件自身设置enableLoading为不设置、在contentModifier中设置enableLoading为true | 组件2组 |
| `SUB_ACE_UI_loadingProgress_0010` | Loading刷新图标动效为非匀速 | 组件2组 |
| `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0130` | 环形进度条设置颜色与添加扫光动效，RingStyleOptionsshadow设置为true | 组件2组 |
| `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0190` | 环形进度条设置颜色与添加扫光动效，设置ProgressType.Ring,color设置0xFF0000 | 组件2组 |
| `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0160` | 环形进度条设置颜色与添加扫光动效，status设置为PROCESSING | 组件2组 |
| `SUB_ACE_UI_COMPONENT_INFOMATION_PROGRESS_INTERFACE_0120` | 环形进度条设置颜色与添加扫光动效，RingStyleOptionsshadow设置为false | 组件2组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_ANIMATETO_0011` | Progress与animateTo动效同时使用设置enableSmoothEffect属性为true | 组件2组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_ANIMATETO_0010` | Progress与animateTo动效同时使用设置enableSmoothEffect属性为false | 组件2组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_BADGE_LARGE_FONT_0059` | 不同类型创建方式支持适老化-FrameNode | 组件2组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_PROGRESS_EVENT_0027` | progress组件卡片场景设置隐私隐藏属性，进度到达100% | 组件2组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0022` | 手机设置深色模式，loadingProgress在手机上的应用场景 | 组件2组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_Dark_COLOR_MODE_0026` | 手机设置深色模式，Progress在手机应用中的展示效果 | 组件2组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_PICKER_CONTAINER_0091` | Picker容器差异化测试 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_CUSTOMANIMATION_0070` | TextPicker多列range为string[][]：自定义样式后动态切换样式 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_BUTTON_TEXTPICKER_CUSTOMANIMATION_0120` | TextPicker单列range为带图片TextPickerRangeContent[]：：自定义样式后动态切换样式 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_CAlENDARPICKER_DISABLEDDATE_0020` | CalendarPicker-disabledDateRange-null | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_TRANSFER_0018` | AnimatedDrawableDescriptor类型默认播放验证 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_DC_0032` | DC容器内加载CalendarPicker组件，设置CalendarPicker属性，预期属性功能正常切换 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_DC_0033` | 压力测试多DC容器加在多个组件，设置组件属性，预期属性功能正常切换 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_DC_0035` | 压力测试多个DC容器内加载多个组件，设置组件属性，预期属性功能正常切换 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_CONCURRENCY_EVENT_0036` | 普通模式和沙箱上下文模式混合使用下随机加载50个context，1个context对应1个组件，正确触发事件回调，属性动态修改效果正常 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_API20_0004` | Image组件_alt12_modifier接口测试 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_API20_0008` | Image组件_contentTransition_modifier接口测试 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_API20_0005` | Image组件_supportSvg2接口测试 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_API20_0001` | Image组件_alt22接口测试 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_API20_0006` | Image组件_supportSvg2_modifier接口测试 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_API20_0002` | Image组件_alt22_modifier接口测试 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_TEXTCLOCK_FORMAT_MODIFIER_0015` | TextClock组件format属性测试字符串、资源值、异常值、undefined modifier调用 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_QRCODE_QRCODEVALUE_0013` | QRCode组件QRCodevalue属性测试字符串、资源值 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_API20_0007` | Image组件_contentTransition接口测试 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ANIMATETO_0023` | Image与animateTo动效同时使用增加扫光动效 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_INTERACTION_0010` | 长按图片，可以将其选择的图片拖入另一图片框中，在另一图片框中显示该图片。 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_INTERACTION_0060` | 手指滑动图片，切换显示效果 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_INTERACTION_0020` | 长按、单击、双击、捏合、旋转交互动作 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_MSG_0017` | 触发open file failed错误 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_MSG_0019` | 触发read file failed错误 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_MSG_0005` | 触发sync http task of url failed错误 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_MSG_0022` | 触发make svg dom failed错误 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_MSG_0018` | 触发get file stat failed错误 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_MSG_0013` | 触发get image data by id failed错误 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_MSG_0015` | 触发uri is invalid错误（hap包） | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_ONERROR_MSG_0001` | 循环触发不同的错误场景，观察错误信息 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_MODIFIER_0020` | Modifier调用，Image组件引入网络图源 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_SRC_1120_761` | ImageAnimator组件src图片组播放总时间{Duration:1} | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_DRAWABLEDESCRIPTOR_0034` | 通过new方式构造LayeredDrawableDescriptor初始化三张图进入进行合成利用getPixelMap获取合成图 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_DRAWABLEDESCRIPTOR_0033` | 通过new方式构造LayeredDrawableDescriptor初始化三张图进入进行合成 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_GIF_0011` | 连续播放多张帧间隔较小的动图，在一个列表中进行快速滑动 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_PARSETAGS_0010` | 查看哔哩哔哩svg图片显示效果 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_IMAGE_SUMMARY_0005` | 1、不同格式图片测试属性效果
2、同时设置enhancedImageQualitys和colorFilter属性，看colorFilter属性是否生效
3、测试 enhancedImageQualitys属性的异常值效果
4、同时设置enhancedImageQualitys和黑白渲染属性，看黑白渲染属性是否生效
5、测试 enhancedImageQualitys属性的不同值效果
6、同时设置enhancedImageQualitys和objectFit属性，看ObjectFit属性是否生效 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_IMAGE_SUMMARY_0001` | 1、Image组件与onFinish组合
2、Image组件与onComplete组合
3、Image组件与onError组合 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_AI_0130` | image组件设置obscured属性（纯图片，Image图片带文字内容） | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_QUALITYS_0120` | 同时设置enhancedImageQualitys和拖拽属性draggable，看draggable属性是否生效 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_CROSSPLATFORM_0076` | 测试iterations测试都默认为-1，将duration测试修改为0时图片是否按照1s的间隔一直循环切换格式 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_CROSSPLATFORM_0077` | 测试iterations测试都默认为-1将duration测试修改为1000时图片是否按照每秒换七次图片的时间间隔一直循环切换格式 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_CROSSPLATFORM_0082` | 测试iterations测试都默认为-1将iterations测试修改为1，duration测试修改为1000时图片是否按照每秒换七次图片只进行一次切换格式 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_CROSSPLATFORM_0083` | 测试iterations测试都默认为-1将iterations测试修改为1，duration测试修改为3000时图片是否按照每三秒换七次图片只进行一次切换格式 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_CROSSPLATFORM_0086` | 测试iterations测试都默认为-1将iterations测试修改为3时图片是否按照1s的间隔只循环三次切换格式 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_CROSSPLATFORM_0087` | 测试iterations测试都默认为-1将iterations测试修改为3，
duration测试修改为0时图片是否按照1s的间隔只循环三次切换格式 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_CROSSPLATFORM_0084` | 测试iterations测试都默认为-1将iterations测试修改为1，duration测试修改为7000时图片是否按照每七秒换七次图片只进行一次切换格式 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_CROSSPLATFORM_0088` | 测试iterations测试都默认为-1将iterations测试修改为3，duration测试修改为1000时图片是否按照每秒换七次图片的间隔只循环三次切换格式 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_CROSSPLATFORM_0079` | 测试iterations测试都默认为-1将duration测试修改为7000时图片是否按照每七秒换七次图片的时间间隔一直循环切换格式 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_CROSSPLATFORM_0081` | 测试iterations测试都默认为-1将iterations测试修改为1，duration测试修改为0时图片是否按照1s的间隔只进行一次切换格式 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_CROSSPLATFORM_0085` | 测试iterations测试都默认为-1将iterations测试修改为0时图片是否不进行切换格式 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_CROSSPLATFORM_0078` | 测试iterations测试都默认为-1将duration测试修改为3000时图片是否按照每三秒换七次图片的时间间隔一直循环切换格式 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_IMAGE_CROSSPLATFORM_0080` | 测试iterations测试都默认为-1时图片是否按照1s的间隔只进行一次切换格式 | 组件1组 |
| `TestCase_5f255cbe232a4f89bcc64eb7b9bfd7ae` | 多列TextCascadePickerRangeContent[]向下抛滑 | 组件1组 |
| `TestCase_bac8776d9a​a94f7087bf2e13350d​8157` | 多列TextCascadePickerRangeContent[]多指操作同时滑动多列 | 组件1组 |
| `TestCase_07f07b14baf24fafa7a4743b3b6d6c3b` | 单列string[]向下滑动 | 组件1组 |
| `TestCase_17c8e9a5845645029f5c7b91379c3fa9` | 多列TextCascadePickerRangeContent[]点击上面备选项 | 组件1组 |
| `TestCase_d0cf236fa8224bb4b73ffea51564af48` | 单列Resource向下抛滑 | 组件1组 |
| `TestCase_47f5cf97c3834fda9cfc71b13bce5b35` | 单列Resource点击上面备选项 | 组件1组 |
| `TestCase_22fa9676bd734062a2f6ee37f58849ea` | 单列Resource向上抛滑 | 组件1组 |
| `TestCase_4b69a29e043d49f2826d78cdfa38c301` | 单列TextPickerRangeContent[]向上拖动 | 组件1组 |
| `TestCase_3432d74b60784c37a3bbd9e7827161e7` | 单列string[]点击上面备选项 | 组件1组 |
| `TestCase_6798a737e3c44b3ca369132b6d5539a9` | 单列string[]点击下面备选项 | 组件1组 |
| `TestCase_1ea6a​a​a​a59164ca09f779055a5f552bf` | 多列string[][]向下滑动 | 组件1组 |
| `TestCase_45a89390e1fa4ed​886efd​8313e14becd` | 多列string[][]向上抛滑 | 组件1组 |
| `TestCase_ee1555843b47437d94fdbd7b31861ca3` | 手表TimePicker1：TimePicker设置loop（true）,digitalCrownSensitivity（MEDIUM），disappearTextStyle、textStyle、selectedTextStyle都为（color：Pink，font: { size: "26fp", weight: FontWeight.Lighter,family:"Arial", style: FontStyle.Normal}），onChange事件，useMilitaryTime（true）,dateTimeOptions（2-digit）,format（HOUR_MINUTE_SECOND） | 组件1组 |
| `TestCase_0d3bfb95867e48e1a​a​a4d247bb714fd9` | 手表DatePicker6：DatePicker设置lunar（true）、镜像语言（维吾尔语） | 组件1组 |
| `TestCase_ad4440e5bc0f413a85c61c027db1963d` | 手表TimePicker6：TimePicker设置loop（true）,不设置digitalCrownSensitivity（MEDIUM），disappearTextStyle、textStyle、selectedTextStyle都为（color：$r("app.string.string1"#FFFF00)，font: { size:$r("app.string.string26"26, weight: FontWeight.Bolder,family:"Arial", style: FontStyle.Italic}），onChange事件，dateTimeOptions（2-digit）,不设置useMilitaryTime和format | 组件1组 |
| `TestCase_9e50abe1fbb54022a36cae3109ffe7e6` | 手表DatePicker14：DatePicker设置lunar（false）、镜像语言（维吾尔语） | 组件1组 |
| `TestCase_130eeddceede43fca1de0045458fccd​8` | 手表DatePicker8：DatePicker设置lunar（true）、稳定性 | 组件1组 |
| `SUB_TV_UX_ImageAnimator_009` | 【imageAnimator】用户自定义borderradius，校验与修改值一致 | 组件1组 |
| `TestCase_3f2e053adf414cd98e740c5d0c7b5ce1` | 手表TimePicker5：TimePicker设置loop（true）,digitalCrownSensitivity（MEDIUM），disappearTextStyle、textStyle、selectedTextStyle都为（color：$r("app.string.string1"#FFFF00)，font: { size:$r("app.string.string26"26, weight: FontWeight.Bolder,family:"Arial", style: FontStyle.Italic}），onChange事件，useMilitaryTime（true）,dateTimeOptions（2-digit）,format（HOUR_MINUTE_SECOND） | 组件1组 |
| `TestCase_bf29740579c44dfeac0d5c6c028cda11` | 手表DatePicker9：DatePicker设置lunar（false）,digitalCrownSensitivity（MEDIUM），disappearTextStyle、textStyle、selectedTextStyle都为（color：Pink，font: { size: "26fp", weight: FontWeight.Lighter,family:"Arial", style: FontStyle.Normal}），onDateChange事件 | 组件1组 |
| `TestCase_4e3772419cdb40e5970f5d​85160b2cc1` | 手表DatePicker4：DatePicker设置lunar（true）,digitalCrownSensitivity（null），disappearTextStyle、textStyle、selectedTextStyle都为（color：$r("app.string.string1"#FFFF00)，font: { size:$r("app.string.string26"26, weight: FontWeight.Bold,family:"Arial", style: FontStyle.Normal}），onDateChange事件 | 组件1组 |
| `TestCase_6a5f4a​ae88564e12a88e950de5f1a​afb` | 手表TimePicker10：TimePicker设置loop（false）,digitalCrownSensitivity（HIGH），disappearTextStyle、textStyle、selectedTextStyle都为（color：0xff0000，font: { size: 30, weight: FontWeight.Normal,family:"OpenHarmony Sans", style: FontStyle.Italic}），onChange事件，useMilitaryTime（false）,dateTimeOptions（numeric）,format（HOUR_MINUTE） | 组件1组 |
| `SUB_TV_UX_ImageAnimator_003` | 【ImageAnimator】推入overlay，校验TV样式无差异 | 组件1组 |
| `SUB_TV_TextPicker_FadingEdge_15` | range内容为文本，超长内容有渐隐 | 组件1组 |
| `SUB_TV_DatePicker_UI_030` | 030.【DatePicker】不推入overlay，验证标准模式备忘录应用中datepicker | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_PICKER_TVLAYER_0017` | 大屏端TextPicker遥控器触控板滑动验证 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_PICKER_TVLAYER_0016` | 大屏端DataPicker遥控器触控板滑动验证 | 组件1组 |
| `SUB_ACE_UI_COMPONENT_MEDIA_PICKER_TVLAYER_0018` | 大屏端TimePicker遥控器触控板滑动验证 | 组件1组 |
| `SUB_TV_UX_TextPicker_001` | 【Picker】不推入overlay，校验标准模式下，手机上与原样式无差异 | 组件1组 |
| `SUB_TV_UX_TextPicker_037` | 【Picker】联动textpicker前后列切换效果 | 组件1组 |
