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
import { router } from '@kit.ArkUI'

@Entry
@Component
struct RouterTargetPage100 {
  @State receivedParams: string = '';
  @State routerStackInfo: string = '';

  aboutToAppear() {
    this.loadReceivedParams();
    this.updateRouterStackInfo();
  }

  // 加载接收到的参数
  loadReceivedParams() {
    try {
      const params = router.getParams();
      if (params) {
        this.receivedParams = `接收到的参数：\n${JSON.stringify(params, null, 2)}`;
        console.info('目标页面接收到参数:', JSON.stringify(params));
      } else {
        this.receivedParams = '未接收到任何参数';
      }
    } catch (err) {
      this.receivedParams = '获取参数失败';
      console.error('获取参数失败:', JSON.stringify(err));
    }
  }

  // 获取当前路由栈信息
  updateRouterStackInfo() {
    try {
      const length = router.getLength();
      const state = router.getState();
      this.routerStackInfo = `路由栈深度: ${length}\n当前页面: ${state.name || '未知'}\n当前路径: ${state.path || '未知'}`;
    } catch (err) {
      this.routerStackInfo = '获取路由信息失败';
    }
  }

  build() {
    Column() {
      Text('命名路由目标页面')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor('#007dff')
        .margin({ bottom: 30 })

      Text('✅ 命名路由跳转成功！')
        .fontSize(18)
        .fontColor('#4caf50')
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 20 })

      Text(this.routerStackInfo)
        .fontSize(14)
        .textAlign(TextAlign.Center)
        .backgroundColor('#e8f5e8')
        .padding(15)
        .borderRadius(10)
        .margin({ bottom: 20 })
        .width('90%')

      Text(this.receivedParams)
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .backgroundColor('#f5f5f5')
        .padding(15)
        .borderRadius(10)
        .margin({ bottom: 30 })
        .width('90%')

      Button('返回上一页 (back)')
        .onClick(() => {
          try {
            router.back();
            console.info('返回上一页成功');
          } catch (err) {
            console.error('返回失败:', JSON.stringify(err));
          }
        })
        .width('80%')
        .backgroundColor('#ff5722')
        .fontColor('#ffffff')

      Button('返回到指定页面')
        .onClick(() => {
          try {
            router.back({
              url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface100'
            });
            console.info('返回到指定页面成功');
          } catch (err) {
            console.error('返回到指定页面失败:', JSON.stringify(err));
          }
        })
        .width('80%')
        .backgroundColor('#9c27b0')
        .fontColor('#ffffff')
        .margin({ top: 10 })

      Button('刷新页面信息')
        .onClick(() => {
          this.loadReceivedParams();
          this.updateRouterStackInfo();
        })
        .width('80%')
        .backgroundColor('#607d7b')
        .fontColor('#ffffff')
        .margin({ top: 10 })

      Divider()
        .margin({ top: 30, bottom: 20 })

      Text('测试验证信息:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. 成功接收到命名路由传递的参数\n' +
        '2. 路由栈深度正确增加\n' +
        '3. 页面路径显示正确\n' +
        '4. 支持返回操作')
        .fontSize(14)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .alignSelf(ItemAlign.Start)
        .lineHeight(20)

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .padding(20)
  }
}
