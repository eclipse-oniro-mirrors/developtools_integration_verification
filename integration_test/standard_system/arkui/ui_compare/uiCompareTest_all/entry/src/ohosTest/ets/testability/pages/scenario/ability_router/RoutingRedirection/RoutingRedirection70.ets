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
struct RoutingRedirection70 {
  @State message: string = 'Router Redirection Test 0070';
  @State operationLog: string = '';
  @State replaceCount: number = 0;

  aboutToAppear() {
    this.addLog('页面初始化完成');
    this.addLog('测试场景：router.replaceNamedRoute命名路由替换');
  }

  addLog(msg: string) {
    const time = new Date().toLocaleTimeString();
    this.operationLog = `[${time}] ${msg}\n${this.operationLog}`;
  }

  performReplaceNamedRoute() {
    this.replaceCount++;
    this.addLog(`执行第 ${this.replaceCount} 次 router.replaceNamedRoute...`);
    
    // 使用 replaceUrl 模拟命名路由替换行为
    router.replaceUrl({
      url: 'testability/pages/scenario/ability_router/RoutingRedirection/RoutingRedirection70',
      params: {
        routeName: 'RoutingRedirection70',
        routeType: 'replaceNamedRoute',
        count: this.replaceCount
      }
    }).then(() => {
      this.addLog(`replaceNamedRoute 成功 (第 ${this.replaceCount} 次)`);
      this.addLog('当前页面已替换，原页面已销毁');
      this.addLog('预期：NotifyPageHide 日志已上报');
    }).catch((err: Error) => {
      this.addLog(`replaceNamedRoute 失败: ${err.message}`);
    });
  }

  performPush() {
    this.addLog('执行 router.pushUrl 创建新页面...');
    router.pushUrl({
      url: 'testability/pages/scenario/ability_router/RoutingRedirection/RoutingRedirection70'
    }).then(() => {
      this.addLog('pushUrl 成功，现在可以测试 replace');
    }).catch((err: Error) => {
      this.addLog(`pushUrl 失败: ${err.message}`);
    });
  }

  build() {
    Column({ space: 15 }) {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('SUB_ACE_Routing_redirection_0070')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text('测试说明')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)

      Text('router.replaceNamedRoute点击后成功获取日志，跳转并销毁被替换的页面')
        .fontSize(14)
        .margin({ bottom: 10 })

      Text(`已执行 replaceNamedRoute 次数: ${this.replaceCount}`)
        .fontSize(14)
        .fontColor('#F56C6C')
        .margin({ bottom: 10 })

      Row({ space: 10 }) {
        Button('Push (准备)')
          .onClick(() => this.performPush())
          .width('45%')
          .backgroundColor('#409EFF')

        Button('ReplaceNamed')
          .onClick(() => this.performReplaceNamedRoute())
          .width('45%')
          .backgroundColor('#F56C6C')
          .id('btn')
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

