/**
 * Copyright (c) 2025 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

@Entry
@Component
struct UiPcUxconsistency0060 {
  build() {
    Column() {
      Navigation() {
        Column() {
          Text('测试用例: SUB_ACE_UI_PC_UXCONSISTENCY_0060')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 10 })
          
          Text('测试目标: 拖动导航栏隐藏、显示情况下 NavBar 失焦灰显测试')
            .fontSize(14)
            .fontColor('#666666')
            .margin({ bottom: 10 })

          Text('配置说明: NavigationMode 设置为 Auto，可根据窗口大小自动调整')
            .fontSize(12)
            .fontColor('#888888')
            .margin({ bottom: 20 })
          
          Text('导航栏内容区域')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 15 })
          
          Text('NavigationMode: Auto')
            .fontSize(16)
            .fontColor('#666666')
            .margin({ bottom: 10 })
          
          Text('说明: 导航栏会根据窗口大小自动显示或隐藏')
            .fontSize(14)
            .fontColor('#999999')
            .margin({ bottom: 10 })
            .textAlign(TextAlign.Center)
            .width('80%')
          
          Text('测试操作: 拖动缩小窗口至导航栏消失')
            .fontSize(14)
            .fontColor('#FF6600')
            .margin({ top: 15 })
          
          Text('预期效果: 导航栏从显示半透明灰色蒙层状态过渡到完全消失状态')
            .fontSize(12)
            .fontColor('#999999')
            .margin({ top: 20 })
            .textAlign(TextAlign.Center)
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
        .backgroundColor('#f9f9f9')
        .padding(30)
      }
      .id('navigation_uxconsistency_0060')
      .title('导航标题')
      .mode(NavigationMode.Auto)
      .width('100%')
      .height('100%')
    }
    .width('100%')
    .height('100%')
  }
}

