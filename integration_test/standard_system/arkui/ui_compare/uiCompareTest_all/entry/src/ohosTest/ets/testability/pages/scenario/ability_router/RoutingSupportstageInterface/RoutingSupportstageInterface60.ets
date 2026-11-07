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
struct RouterPage60 {
  @State routerStackInfo: string = '';
  @State operationLog: string = '';

  aboutToAppear() {
    this.updateRouterStackInfo();
    this.addLog('Router.pushUrl 测试页面初始化完成');
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

  // 基础 pushUrl 跳转（带参数）
  basicPushUrl() {
    this.addLog('执行基础 pushUrl 跳转...');
    
    try {
      router.pushUrl({
        url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface60_target',
        params: {
          fromPage: 'RoutingSupportstageInterface60',
          testType: '基础pushUrl',
          testId: 60,
          timestamp: Date.now(),
          data: {
            title: '基础跳转测试',
            description: '这是一个基础的pushUrl跳转测试',
            items: ['项目1', '项目2', '项目3']
          }
        }
      });
      
      console.info('基础 pushUrl 跳转已执行');
      this.addLog('基础 pushUrl 跳转已执行');
      
    } catch (err) {
      console.error('基础 pushUrl 跳转失败:', JSON.stringify(err));
      this.addLog(`基础 pushUrl 跳转失败: ${JSON.stringify(err)}`);
    }
  }

  // Promise 方式 pushUrl 跳转
  promisePushUrl() {
    this.addLog('执行 Promise 方式 pushUrl 跳转...');
    
    router.pushUrl({
      url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface60_target',
      params: {
        fromPage: 'RoutingSupportstageInterface60',
        testType: 'Promise pushUrl',
        testId: 60,
        timestamp: Date.now(),
        data: {
          title: 'Promise跳转测试',
          description: '这是一个Promise方式的pushUrl跳转测试',
          features: ['支持异步处理', '错误捕获', '状态回调']
        }
      }
    }).then(() => {
      console.info('Promise 方式 pushUrl 跳转成功');
      this.addLog('Promise 方式 pushUrl 跳转成功');
    }).catch((err: BusinessError) => {
      console.error('Promise 方式 pushUrl 跳转失败:', JSON.stringify(err));
      this.addLog(`Promise 方式 pushUrl 跳转失败: ${err.message}`);
    });
  }

  // 回调方式 pushUrl 跳转
  callbackPushUrl() {
    this.addLog('执行回调方式 pushUrl 跳转...');
    
    try {
      router.pushUrl({
        url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface60_target',
        params: {
          fromPage: 'RoutingSupportstageInterface60',
          testType: '回调pushUrl',
          testId: 60,
          timestamp: Date.now(),
          data: {
            title: '回调跳转测试',
            description: '这是一个回调方式的pushUrl跳转测试',
            callback: true
          }
        }
      }, router.RouterMode.Standard, (err) => {
        if (err) {
          console.error('回调方式 pushUrl 跳转失败:', JSON.stringify(err));
          this.addLog(`回调方式 pushUrl 跳转失败: ${err.message}`);
        } else {
          console.info('回调方式 pushUrl 跳转成功');
          this.addLog('回调方式 pushUrl 跳转成功');
        }
      });
    } catch (err) {
      console.error('回调方式 pushUrl 跳转异常:', JSON.stringify(err));
      this.addLog(`回调方式 pushUrl 跳转异常: ${JSON.stringify(err)}`);
    }
  }

  // Standard 路由模式跳转
  standardModePushUrl() {
    this.addLog('执行 Standard 模式 pushUrl 跳转...');
    
    router.pushUrl({
      url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface60_target',
      params: {
        fromPage: 'RoutingSupportstageInterface60',
        testType: 'Standard模式pushUrl',
        testId: 60,
        routerMode: 'Standard',
        timestamp: Date.now(),
        data: {
          title: 'Standard模式跳转',
          description: '这是Standard路由模式的pushUrl跳转测试',
          mode: 'router.RouterMode.Standard'
        }
      }
    }, router.RouterMode.Standard).then(() => {
      console.info('Standard 模式 pushUrl 跳转成功');
      this.addLog('Standard 模式 pushUrl 跳转成功');
    }).catch((err: BusinessError) => {
      console.error('Standard 模式 pushUrl 跳转失败:', JSON.stringify(err));
      this.addLog(`Standard 模式 pushUrl 跳转失败: ${err.message}`);
    });
  }

  // Single 路由模式跳转
  singleModePushUrl() {
    this.addLog('执行 Single 模式 pushUrl 跳转...');
    
    router.pushUrl({
      url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface60_target',
      params: {
        fromPage: 'RoutingSupportstageInterface60',
        testType: 'Single模式pushUrl',
        testId: 60,
        routerMode: 'Single',
        timestamp: Date.now(),
        data: {
          title: 'Single模式跳转',
          description: '这是Single路由模式的pushUrl跳转测试',
          mode: 'router.RouterMode.Single'
        }
      }
    }, router.RouterMode.Single).then(() => {
      console.info('Single 模式 pushUrl 跳转成功');
      this.addLog('Single 模式 pushUrl 跳转成功');
    }).catch((err: BusinessError) => {
      console.error('Single 模式 pushUrl 跳转失败:', JSON.stringify(err));
      this.addLog(`Single 模式 pushUrl 跳转失败: ${err.message}`);
    });
  }

  build() {
    Column() {
      Text('Router pushUrl() 接口测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('跳转到应用内指定页面')
        .fontSize(16)
        .fontColor('#666666')
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
        .backgroundColor('#e3f2fd')
        .padding(15)
        .borderRadius(10)
        .margin({ bottom: 20 })
        .width('90%')

      // pushUrl 测试按钮组
      Button('基础 pushUrl 跳转')
        .onClick(() => {
          this.basicPushUrl();
        })
        .id('btn')
        .width('85%')
        .backgroundColor('#007dff')
        .fontColor('#ffffff')

      Button('Promise 方式跳转')
        .onClick(() => {
          this.promisePushUrl();
        })
        .width('85%')
        .backgroundColor('#4caf50')
        .fontColor('#ffffff')
        .margin({ top: 8 })

      Button('回调方式跳转')
        .onClick(() => {
          this.callbackPushUrl();
        })
        .width('85%')
        .backgroundColor('#ff9800')
        .fontColor('#ffffff')
        .margin({ top: 8 })

      Button('Standard 模式跳转')
        .onClick(() => {
          this.standardModePushUrl();
        })
        .width('85%')
        .backgroundColor('#9c27b0')
        .fontColor('#ffffff')
        .margin({ top: 8 })

      Button('Single 模式跳转')
        .onClick(() => {
          this.singleModePushUrl();
        })
        .width('85%')
        .backgroundColor('#f44336')
        .fontColor('#ffffff')
        .margin({ top: 8 })

      Button('刷新路由栈信息')
        .onClick(() => {
          this.updateRouterStackInfo();
          this.addLog('已刷新路由栈信息');
        })
        .width('85%')
        .backgroundColor('#607d7b')
        .fontColor('#ffffff')
        .margin({ top: 15 })

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
          .constraintSize({ minHeight: 100, maxHeight: 120 })
      }
      .width('90%')
      .height('9.84%')

      Button('清空操作日志')
        .onClick(() => {
          this.operationLog = '';
          this.addLog('操作日志已清空');
        })
        .width('60%')
        .backgroundColor('#9e9e9e')
        .fontColor('#ffffff')
        .margin({ top: 10 })

      Divider()
        .margin({ top: 15, bottom: 10 })

      // 功能说明
      Text('功能说明:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. pushUrl() - 保留当前页面，跳转到新页面\n' +
        '2. 支持参数传递和多种异步处理方式\n' +
        '3. Standard模式: 标准跳转，会增加栈深度\n' +
        '4. Single模式: 单实例跳转，清除同页面实例')
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

