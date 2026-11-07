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

@Entry({ routeName: 'RoutingNamedRoutesInterface50' })
@Component
struct RoutingNamedRoutesInterface50 {
  @State message: string = 'SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0050';
  @State operationLog: string = '';

  aboutToAppear(): void {
    this.addLog('页面初始化完成');
    this.addLog('测试场景：router.pushNamedRoute同步接口错误码测试');
  }

  addLog(msg: string): void {
    const time = new Date().toLocaleTimeString();
    this.operationLog = `[${time}] ${msg}\n${this.operationLog}`;
  }

  testInvalidRouteName(): void {
    this.addLog('测试无效的路由名称...');
    try {
      router.pushNamedRoute({
        name: 'NonExistentRoute12345',
        params: {}
      });
      this.addLog('调用未抛出异常（预期应该失败）');
    } catch (err) {
      this.addLog(`捕获到预期错误: ${JSON.stringify(err)}`);
    }
  }

  testInvalidParams(): void {
    this.addLog('测试无效的参数...');
    try {
      router.pushNamedRoute({
        name: '',
        params: {}
      });
      this.addLog('调用未抛出异常（预期应该失败）');
    } catch (err) {
      this.addLog(`捕获到预期错误: ${JSON.stringify(err)}`);
    }
  }

  build() {
    Column({ space: 15 }) {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('router.pushNamedRoute同步接口错误码测试')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Button('测试无效路由名称')
        .onClick(() => this.testInvalidRouteName())
        .width('80%')
        .id('btn')

      Button('测试空路由名称')
        .onClick(() => this.testInvalidParams())
        .width('80%')
        .backgroundColor('#E6A23C')

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

      Text('预期结果：能够正确捕获并返回错误码')
        .fontSize(14)
        .fontColor(Color.Green)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

