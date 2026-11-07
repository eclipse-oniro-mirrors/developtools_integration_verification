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

@Entry({ routeName: 'RoutingNamedRoutesInterface210' })
@Component
struct RoutingNamedRoutesInterface210 {
  @State message: string = 'SUB_ACE_Routing_NAMEDROUTES_INTERFACE_0210';
  @State operationLog: string = '';

  aboutToAppear(): void {
    this.addLog('页面初始化完成');
    this.addLog('测试场景：命名路由不为null时，且页面配置在mainPage.json中时，使用pushNamedRoute接口能够成功跳转对应页面');
  }

  addLog(msg: string): void {
    const time = new Date().toLocaleTimeString();
    this.operationLog = `[${time}] ${msg}\n${this.operationLog}`;
  }

  testValidRouteJump(): void {
    this.addLog('测试跳转到已配置的命名路由页面...');
    router.pushNamedRoute({
      name: 'RoutingNamedRoutesInterface220',
      params: { from: '0210', testType: 'valid route' }
    }).then(() => {
      this.addLog('跳转成功');
    }).catch((err: BusinessError) => {
      this.addLog(`跳转失败: ${JSON.stringify(err)}`);
    });
  }

  build() {
    Column({ space: 15 }) {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Text('命名路由配置在mainPage.json中时能成功跳转')
        .fontSize(14)
        .fontColor(Color.Gray)

      Divider()

      Button('测试有效路由跳转')
        .onClick(() => this.testValidRouteJump())
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

      Text('预期结果：能够成功跳转到已配置的命名路由页面')
        .fontSize(14)
        .fontColor(Color.Green)
        .margin({ top: 20 })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

