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
struct RoutingRedirection90 {
  @State message: string = 'Router Redirection Test 0090';
  @State operationLog: string = '';
  @State operationCount: number = 0;

  aboutToAppear() {
    this.addLog('页面初始化完成');
    this.addLog('测试场景：反复进行页面跳转');
  }

  addLog(msg: string) {
    const time = new Date().toLocaleTimeString();
    this.operationLog = `[${time}] ${msg}\n${this.operationLog}`;
  }

  performRepeatRouting() {
    this.operationCount++;
    const operation = this.operationCount % 2 === 0 ? 'pushUrl' : 'replaceUrl';
    
    this.addLog(`执行第 ${this.operationCount} 次路由操作: ${operation}`);
    
    if (operation === 'pushUrl') {
      router.pushUrl({
        url: 'testability/pages/scenario/ability_router/RoutingRedirection/RoutingRedirection90',
        params: { count: this.operationCount }
      }).then(() => {
        this.addLog(`${operation} 成功 (第 ${this.operationCount} 次)`);
      }).catch((err: Error) => {
        this.addLog(`${operation} 失败: ${err.message}`);
      });
    } else {
      router.replaceUrl({
        url: 'testability/pages/scenario/ability_router/RoutingRedirection/RoutingRedirection90',
        params: { count: this.operationCount }
      }).then(() => {
        this.addLog(`${operation} 成功 (第 ${this.operationCount} 次)`);
      }).catch((err: Error) => {
        this.addLog(`${operation} 失败: ${err.message}`);
      });
    }
  }

  performRouterBack() {
    this.addLog('执行 router.back 返回...');
    try {
      router.back();
      this.addLog('router.back 执行成功');
    } catch (err) {
      this.addLog(`router.back 失败: ${JSON.stringify(err)}`);
    }
  }

  clearLog() {
    this.operationLog = '';
    this.operationCount = 0;
    this.addLog('日志已清空，计数器已重置');
  }

  build() {
    Column({ space: 15 }) {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('SUB_ACE_Routing_redirection_0090')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text('测试说明')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)

      Text('反复进行页面跳转，测试路由操作稳定性')
        .fontSize(14)
        .margin({ bottom: 10 })

      Text(`已执行路由操作次数: ${this.operationCount}`)
        .fontSize(14)
        .fontColor('#F56C6C')
        .margin({ bottom: 10 })

      Row({ space: 10 }) {
        Button('反复路由')
          .onClick(() => this.performRepeatRouting())
          .width('30%')
          .backgroundColor('#F56C6C')
          .id('btn')

        Button('返回')
          .onClick(() => this.performRouterBack())
          .width('30%')

        Button('清空日志')
          .onClick(() => this.clearLog())
          .width('30%')
          .backgroundColor('#909399')
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

