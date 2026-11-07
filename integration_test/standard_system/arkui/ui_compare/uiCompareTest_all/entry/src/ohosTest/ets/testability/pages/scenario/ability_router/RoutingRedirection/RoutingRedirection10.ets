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
struct RoutingRedirection10 {
  @State message: string = 'Router Redirection Test 0010';
  @State operationLog: string = '';

  aboutToAppear() {
    this.addLog('页面初始化完成');
    this.addLog('测试场景：页面正常跳转，上报页面路径给元能力');
  }

  addLog(msg: string) {
    const time = new Date().toLocaleTimeString();
    this.operationLog = `[${time}] ${msg}\n${this.operationLog}`;
  }

  performRouterPush() {
    this.addLog('执行 router.pushUrl 页面跳转...');
    router.pushUrl({
      url: 'testability/pages/scenario/ability_router/RoutingRedirection/RoutingRedirection10',
      params: {
        data: '测试数据',
        timestamp: Date.now()
      }
    }).then(() => {
      this.addLog('router.pushUrl 成功，页面已跳转');
      this.addLog('预期：NotifyPageHide 日志已上报');
    }).catch((err: Error) => {
      this.addLog(`router.pushUrl 失败: ${err.message}`);
    });
  }

  build() {
    Column({ space: 15 }) {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('SUB_ACE_Routing_redirection_0010')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text('测试说明')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)

      Text('页面跳转支持上报页面路径给元能力，页面正常跳转')
        .fontSize(14)
        .margin({ bottom: 10 })

      Button('执行页面跳转')
        .onClick(() => this.performRouterPush())
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

      Text('预期结果：成功上报页面路径给元能力')
        .fontSize(14)
        .fontColor(Color.Green)
        .margin({ top: 20 })

      Text('验证方式：hilog | grep NotifyPageHide')
        .fontSize(12)
        .fontColor('#909399')
        .margin({ top: 10 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

