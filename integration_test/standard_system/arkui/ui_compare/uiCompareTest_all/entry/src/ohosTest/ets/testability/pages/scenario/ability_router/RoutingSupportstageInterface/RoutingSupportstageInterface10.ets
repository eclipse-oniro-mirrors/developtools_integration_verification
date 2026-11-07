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
import { BusinessError } from '@kit.BasicServicesKit';

class InnerParams {
  data3:number[]

  constructor(tuple:number[]) {
    this.data3 = tuple
  }
}

class RouterParams {
  data1:string
  data2:InnerParams

  constructor(str:string, tuple:number[]) {
    this.data1 = str
    this.data2 = new InnerParams(tuple)
  }
}

@Entry
@Component
struct RouterPage10 {
  @State routerStackInfo: string = '';
  @State operationLog: string = '';

  aboutToAppear() {
    this.updateRouterStackInfo();
    this.addLog('Router.back 测试主页面初始化完成');
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

  // 添加操作日志
  addLog(message: string) {
    const timestamp = new Date().toLocaleTimeString();
    this.operationLog = `[${timestamp}] ${message}\n${this.operationLog}`;
  }

  // 跳转到测试页面（为返回操作创建上一页）
  navigateToTargetPage() {
    this.addLog('准备跳转到目标页面...');
    
    try {
      router.pushUrl({
        url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface10_target',
        params: {
          fromPage: 'RoutingSupportstageInterface10',
          testId: 10,
          startTime: Date.now(),
          message: '来自router.back测试主页面'
        }
      }).then(() => {
        console.info('跳转到目标页面成功');
        this.addLog('成功跳转到目标页面');
      }).catch((err: BusinessError) => {
        console.error('跳转失败:', JSON.stringify(err));
        this.addLog(`跳转失败: ${err.message}`);
      });
    } catch (err) {
      console.error('跳转异常:', JSON.stringify(err));
      this.addLog('跳转发生异常');
    }
  }

  // 测试直接返回（用于测试当前页面的返回行为）
  testDirectBack() {
    this.addLog('测试直接返回操作...');
    
    try {
      router.back();
      console.info('直接返回操作已执行');
      this.addLog('直接返回操作已执行');
    } catch (err) {
      console.error('直接返回失败:', JSON.stringify(err));
      this.addLog(`直接返回失败: ${JSON.stringify(err)}`);
    }
  }

  build() {
    Column() {
      Text('Router back() 接口测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('主测试页面')
        .fontSize(18)
        .fontColor('#007dff')
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 15 })

      // 路由栈信息显示
      Text('当前路由栈信息:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ bottom: 10 })

      Text(this.routerStackInfo)
        .fontSize(14)
        .textAlign(TextAlign.Center)
        .backgroundColor('#f0f8ff')
        .padding(15)
        .borderRadius(10)
        .margin({ bottom: 20 })
        .width('90%')

      // 主要测试按钮
      Button('跳转到目标页面')
        .onClick(() => {
          this.navigateToTargetPage();
        })
        .id('btn')
        .width('85%')
        .backgroundColor('#007dff')
        .fontColor('#ffffff')

      Button('测试直接返回 (back)')
        .onClick(() => {
          this.testDirectBack();
        })
        .width('85%')
        .backgroundColor('#ff9800')
        .fontColor('#ffffff')
        .margin({ top: 10 })

      Button('刷新路由栈信息')
        .onClick(() => {
          this.updateRouterStackInfo();
          this.addLog('已刷新路由栈信息');
        })
        .width('85%')
        .backgroundColor('#4caf50')
        .fontColor('#ffffff')
        .margin({ top: 10 })

      Divider()
        .margin({ top: 20, bottom: 15 })

      // 操作日志区域
      Text('操作日志:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ bottom: 10 })

      Scroll() {
        Text(this.operationLog || '暂无操作记录')
          .fontSize(12)
          .textAlign(TextAlign.Start)
          .backgroundColor('#f9f9f9')
          .padding(10)
          .borderRadius(8)
          .width('100%')
          .constraintSize({ minHeight: 120, maxHeight: 180 })
      }
      .width('90%')
      .height('14.75%')

      Button('清空操作日志')
        .onClick(() => {
          this.operationLog = '';
          this.addLog('操作日志已清空');
        })
        .width('60%')
        .backgroundColor('#607d7b')
        .fontColor('#ffffff')
        .margin({ top: 10 })

      Divider()
        .margin({ top: 20, bottom: 15 })

      // 测试说明
      Text('测试说明:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. 点击"跳转到目标页面"创建页面栈\n' +
        '2. 在目标页面测试各种返回方式\n' +
        '3. 验证返回到上一页或指定页面\n' +
        '4. 观察路由栈深度变化')
        .fontSize(12)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .alignSelf(ItemAlign.Start)
        .lineHeight(18)

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding(20)
    .scrollable(ScrollDirection.Vertical)
  }
}
