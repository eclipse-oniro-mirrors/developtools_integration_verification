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

@Entry
@Component
struct RoutingRedirection30 {
  @State message: string = 'Router Redirection Test 0030';
  @State operationLog: string = '';

  aboutToAppear() {
    this.addLog('页面初始化完成');
    this.addLog('测试场景：A包拉起B包页面，B里面router跳转');
  }

  addLog(msg: string) {
    const time = new Date().toLocaleTimeString();
    this.operationLog = `[${time}] ${msg}\n${this.operationLog}`;
  }

  performRouterPush() {
    this.addLog('执行 router.pushUrl 操作...');
    router.pushUrl({
      url: 'testability/pages/scenario/ability_router/RoutingRedirection/RoutingRedirection30'
    }).then(() => {
      this.addLog('router.pushUrl 成功');
    }).catch((err: Error) => {
      this.addLog(`router.pushUrl 失败: ${err.message}`);
    });
  }

  performRouterBack() {
    this.addLog('执行 router.back 操作...');
    router.back();
  }

  build() {
    Column({ space: 15 }) {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('SUB_ACE_Routing_redirection_0030')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text('测试说明')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)

      Text('两个hap包之间相互跳转，A包拉起B包页面，B包内router跳转')
        .fontSize(14)
        .margin({ bottom: 10 })

      Row({ space: 10 }) {
        Button('Router Push')
          .onClick(() => this.performRouterPush())
          .width('45%')
          .id('btn')

        Button('Router Back')
          .onClick(() => this.performRouterBack())
          .width('45%')
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)

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

      Text('预期结果：成功上报页面路径给元能力')
        .fontSize(14)
        .fontColor(Color.Green)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
