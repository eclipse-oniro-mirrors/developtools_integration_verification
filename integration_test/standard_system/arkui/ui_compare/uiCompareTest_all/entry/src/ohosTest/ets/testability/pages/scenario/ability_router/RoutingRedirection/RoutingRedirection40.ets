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
struct RoutingRedirection40 {
  @State message: string = 'Router Redirection Test 0040';
  @State operationLog: string = '';

  aboutToAppear() {
    this.addLog('页面初始化完成');
    this.addLog('测试场景：router.back点击后成功获取日志');
  }

  addLog(msg: string) {
    const time = new Date().toLocaleTimeString();
    this.operationLog = `[${time}] ${msg}\n${this.operationLog}`;
  }

  performRouterBack() {
    this.addLog('执行 router.back 操作...');
    try {
      router.back();
      this.addLog('router.back 执行成功');
    } catch (err) {
      this.addLog(`router.back 失败: ${JSON.stringify(err)}`);
    }
  }

  performRouterPush() {
    this.addLog('先执行 router.pushUrl 创建路由栈...');
    router.pushUrl({
      url: 'testability/pages/scenario/ability_router/RoutingRedirection/RoutingRedirection40'
    }).then(() => {
      this.addLog('router.pushUrl 成功，现在可以测试 back');
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

      Text('SUB_ACE_Routing_redirection_0040')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text('测试说明')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)

      Text('router.back点击后成功获取日志')
        .fontSize(14)
        .margin({ bottom: 10 })

      Row({ space: 10 }) {
        Button('Router Push (准备)')
          .onClick(() => this.performRouterPush())
          .width('45%')
          .backgroundColor('#409EFF')
          .id('btn')

        Button('Router Back (测试)')
          .onClick(() => this.performRouterBack())
          .width('45%')
          .backgroundColor('#67C23A')
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
