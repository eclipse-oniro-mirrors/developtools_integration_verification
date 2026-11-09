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
import { router } from '@kit.ArkUI';

@Entry({ routeName: 'RoutingNamedRoutesInterface220' })
@Component
struct RoutingNamedRoutesInterface220 {
  @State message: string = 'SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0220';
  @State operationLog: string = '';

  aboutToAppear(): void {
    this.addLog('页面初始化完成');
    this.addLog('测试场景：命名路由的编译器、编译、预览功能正常');
  }

  addLog(msg: string): void {
    const time = new Date().toLocaleTimeString();
    this.operationLog = `[${time}] ${msg}\n${this.operationLog}`;
  }

  checkFeatures(): void {
    this.addLog('检查命名路由功能...');
    this.addLog('1. 编译器识别：@Entry({ routeName: "..." })');
    this.addLog('2. 编译通过：生成正确的路由映射');
    this.addLog('3. 预览功能：能够正常显示页面');
  }

  build() {
    Column({ space: 15 }) {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('命名路由的编译器、编译、预览功能正常')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Button('检查功能状态')
        .onClick(() => this.checkFeatures())
        .width('80%')
        .id('btn')

      Text('操作日志')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)
        .margin({ top: 20 })

      Scroll() {
        Text(this.operationLog)
          .fontSize(12)
          .fontColor('#666666')
          .width('100%')
          .padding(10)
          .backgroundColor('#F5F5F5')
          .borderRadius(5)
      }
      .width('100%')
      .height('200')
      .scrollable(ScrollDirection.Vertical)
      .scrollBar(BarState.Auto)

      Text('预期结果：编译器、编译、预览功能均正常')
        .fontSize(14)
        .fontColor(Color.Green)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

