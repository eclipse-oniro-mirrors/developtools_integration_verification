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
struct RoutingRedirection80 {
  @State message: string = 'Router Redirection Test 0080';
  @State operationLog: string = '';
  @State replaceCount: number = 0;

  aboutToAppear() {
    this.addLog('页面初始化完成');
    this.addLog('测试场景：router.replaceUrl点击后成功获取日志');
  }

  addLog(msg: string) {
    const time = new Date().toLocaleTimeString();
    this.operationLog = `[${time}] ${msg}\n${this.operationLog}`;
  }

  performRouterReplace() {
    this.replaceCount++;
    this.addLog(`执行第 ${this.replaceCount} 次 router.replaceUrl 操作...`);
    router.replaceUrl({
      url: 'testability/pages/scenario/ability_router/RoutingRedirection/RoutingRedirection80',
      params: {
        count: this.replaceCount,
        timestamp: Date.now()
      }
    }).then(() => {
      this.addLog(`router.replaceUrl 成功 (第 ${this.replaceCount} 次)`);
      this.addLog('当前页面已被替换，前一页面被销毁');
    }).catch((err: Error) => {
      this.addLog(`router.replaceUrl 失败: ${err.message}`);
    });
  }

  performRouterPush() {
    this.addLog('执行 router.pushUrl 创建新页面...');
    router.pushUrl({
      url: 'testability/pages/scenario/ability_router/RoutingRedirection/RoutingRedirection80'
    }).then(() => {
      this.addLog('router.pushUrl 成功，页面栈增加');
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

      Text('SUB_ACE_Routing_redirection_0080')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text('测试说明')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)

      Text('router.replaceUrl点击后成功获取日志，销毁被替换页面')
        .fontSize(14)
        .margin({ bottom: 10 })

      Text(`已执行 replaceUrl 次数: ${this.replaceCount}`)
        .fontSize(14)
        .fontColor('#E6A23C')
        .margin({ bottom: 10 })

      Row({ space: 10 }) {
        Button('Router Push')
          .onClick(() => this.performRouterPush())
          .width('45%')
          .backgroundColor('#409EFF')
          .id('btn')

        Button('Router Replace')
          .onClick(() => this.performRouterReplace())
          .width('45%')
          .backgroundColor('#E6A23C')
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
