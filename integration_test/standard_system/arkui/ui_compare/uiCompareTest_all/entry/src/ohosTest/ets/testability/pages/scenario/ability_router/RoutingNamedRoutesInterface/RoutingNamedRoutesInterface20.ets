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

@Entry({ routeName: 'RoutingNamedRoutesInterface20' })
@Component
struct RoutingNamedRoutesInterface20 {
  @State message: string = 'SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0020';
  @State currentPackage: string = '普通ETS页面';
  @State operationLog: string = '';

  aboutToAppear(): void {
    this.addLog('页面初始化完成');
    this.addLog('测试场景：har包/hsp包/普通包相互之间路由跳转');
  }

  addLog(msg: string): void {
    const time = new Date().toLocaleTimeString();
    this.operationLog = `[${time}] ${msg}\n${this.operationLog}`;
  }

  navigateToPage(): void {
    this.addLog('尝试跨模块路由跳转...');
    this.addLog('注意：此测试需要实际配置HAR/HSP模块');
  }

  build() {
    Column({ space: 15 }) {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('har包/hsp包/普通包相互之间路由跳转测试')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text(`当前页面类型: ${this.currentPackage}`)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)

      Button('执行跨包路由跳转')
        .onClick(() => this.navigateToPage())
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

      Text('预期结果：能够在不同类型的模块间进行路由跳转')
        .fontSize(14)
        .fontColor(Color.Green)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

