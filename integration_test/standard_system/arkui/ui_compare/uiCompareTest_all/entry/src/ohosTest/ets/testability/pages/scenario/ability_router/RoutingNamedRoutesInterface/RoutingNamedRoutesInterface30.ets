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
import { BusinessError } from '@kit.BasicServicesKit';

@Entry({ routeName: 'RoutingNamedRoutesInterface30' })
@Component
struct RoutingNamedRoutesInterface30 {
  @State message: string = 'SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0030';
  @State paramsReceived: string = '无参数';
  @State operationLog: string = '';

  aboutToAppear(): void {
    this.addLog('页面初始化完成');
    this.addLog('测试场景：replaceNameRoute接口和getParams接口组合测试');
    this.getRouteParams();
  }

  addLog(msg: string): void {
    const time = new Date().toLocaleTimeString();
    this.operationLog = `[${time}] ${msg}\n${this.operationLog}`;
  }

  getRouteParams(): void {
    try {
      const params = router.getParams();
      if (params) {
        this.paramsReceived = JSON.stringify(params);
        this.addLog(`成功获取参数: ${this.paramsReceived}`);
      } else {
        this.paramsReceived = '未接收到参数';
        this.addLog('未接收到参数');
      }
    } catch (err) {
      this.addLog(`获取参数失败: ${JSON.stringify(err)}`);
    }
  }

  replaceToSecondPage(): void {
    this.addLog('执行 replaceNamedRoute 替换到 RoutingNamedRoutesInterface40...');
    router.replaceNamedRoute({
      name: 'RoutingNamedRoutesInterface40',
      params: {
        source: 'RoutingNamedRoutesInterface30',
        data: 'Replaced from 0030',
        timestamp: Date.now()
      }
    }).then(() => {
      this.addLog('replaceNamedRoute 成功');
    }).catch((err: BusinessError) => {
      this.addLog(`replaceNamedRoute 失败: ${JSON.stringify(err)}`);
    });
  }

  build() {
    Column({ space: 15 }) {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('replaceNameRoute接口和getParams接口组合测试')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Text('接收到的参数:')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)

      Text(this.paramsReceived)
        .fontSize(14)
        .fontColor('#409EFF')
        .margin({ bottom: 10 })

      Button('替换到第二个页面 (带参数)')
        .onClick(() => this.replaceToSecondPage())
        .width('80%')
        .id('btn')

      Button('刷新参数')
        .onClick(() => this.getRouteParams())
        .width('80%')
        .backgroundColor('#67C23A')

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

      Text('预期结果：使用replace跳转后，无法回退到当前页面')
        .fontSize(14)
        .fontColor(Color.Green)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

