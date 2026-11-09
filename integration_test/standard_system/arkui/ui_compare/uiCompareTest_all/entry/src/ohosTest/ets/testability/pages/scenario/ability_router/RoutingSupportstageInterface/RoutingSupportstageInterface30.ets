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
struct RouterPage30 {
  @State currentLength: number = 0;
  @State lengthStatus: string = '';
  @State operationLog: string = '';
  @State lengthHistory: string = '';

  aboutToAppear() {
    this.getCurrentLength();
    this.addLog('Router.getLength 测试页面初始化完成');
  }

  // 获取当前页面栈长度
  getCurrentLength() {
    try {
      const length = router.getLength();
      this.currentLength = length;
      this.lengthStatus = `✅ 成功获取页面栈长度: ${length}`;
      
      // 更新历史记录
      const timestamp = new Date().toLocaleTimeString();
      this.lengthHistory = `[${timestamp}] 栈深度: ${length}\n${this.lengthHistory}`;
      
      console.info(`router.getLength() 返回值: ${length}`);
      this.addLog(`成功获取页面栈长度: ${length}`);
      
    } catch (err) {
      this.lengthStatus = '❌ 获取页面栈长度失败';
      this.currentLength = -1;
      console.error('getLength() 调用失败:', JSON.stringify(err));
      this.addLog(`获取页面栈长度失败: ${JSON.stringify(err)}`);
    }
  }

  // 添加操作日志
  addLog(message: string) {
    const timestamp = new Date().toLocaleTimeString();
    this.operationLog = `[${timestamp}] ${message}\n${this.operationLog}`;
  }

  // 跳转到测试页面并观察长度变化
  pushToTargetPage() {
    this.addLog('准备跳转到目标页面，观察栈长度变化...');
    
    const beforeLength = this.currentLength;
    
    router.pushUrl({
      url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface30_target',
      params: {
        fromPage: 'RoutingSupportstageInterface30',
        beforeLength: beforeLength,
        testId: 30,
        timestamp: Date.now(),
        operation: 'pushUrl'
      }
    }).then(() => {
      console.info('跳转到目标页面成功');
      this.addLog(`跳转成功，跳转前栈长度: ${beforeLength}`);
    }).catch((err: BusinessError) => {
      console.error('跳转失败:', JSON.stringify(err));
      this.addLog(`跳转失败: ${err.message}`);
    });
  }

  // 使用 replaceUrl 替换当前页面
  replaceToTargetPage() {
    this.addLog('准备替换到目标页面，观察栈长度变化...');
    
    const beforeLength = this.currentLength;
    
    router.replaceUrl({
      url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface30_target',
      params: {
        fromPage: 'RoutingSupportstageInterface30',
        beforeLength: beforeLength,
        testId: 30,
        timestamp: Date.now(),
        operation: 'replaceUrl'
      }
    }).then(() => {
      console.info('替换到目标页面成功');
      this.addLog(`替换成功，替换前栈长度: ${beforeLength}`);
    }).catch((err: BusinessError) => {
      console.error('替换失败:', JSON.stringify(err));
      this.addLog(`替换失败: ${err.message}`);
    });
  }

  // 多次跳转测试栈深度累积
  multiplePush() {
    this.addLog('开始多次跳转测试...');
    
    const currentLength = this.currentLength;
    
    // 第一次跳转
    router.pushUrl({
      url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface30_target',
      params: {
        fromPage: 'RoutingSupportstageInterface30',
        beforeLength: currentLength,
        testId: 30,
        operation: 'multiplePush_1',
        step: 1
      }
    }).then(() => {
      this.addLog(`第1次跳转完成，原始栈长度: ${currentLength}`);
      
      // 延时后进行第二次跳转
      setTimeout(() => {
        router.pushUrl({
          url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface30_target',
          params: {
            fromPage: 'RoutingSupportstageInterface30_target',
            beforeLength: currentLength + 1,
            testId: 30,
            operation: 'multiplePush_2',
            step: 2
          }
        }).then(() => {
          this.addLog('第2次跳转完成，栈深度应该增加2层');
        }).catch((err: BusinessError) => {
          this.addLog(`第2次跳转失败: ${err.message}`);
        });
      }, 500);
      
    }).catch((err: BusinessError) => {
      this.addLog(`第1次跳转失败: ${err.message}`);
    });
  }

  // 测试返回操作对栈长度的影响
  testBackOperation() {
    const currentLength = this.currentLength;
    
    if (currentLength <= 1) {
      this.addLog('当前栈深度过小，无法执行返回操作');
      return;
    }
    
    this.addLog(`准备执行返回操作，当前栈长度: ${currentLength}`);
    
    try {
      router.back();
      this.addLog('返回操作已执行');
    } catch (err) {
      this.addLog(`返回操作失败: ${JSON.stringify(err)}`);
    }
  }

  build() {
    Column() {
      Text('Router getLength() 接口测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      Text('获取当前页面栈内的页面数量')
        .fontSize(16)
        .fontColor('#666666')
        .margin({ bottom: 15 })

      // 当前栈长度显示
      Text('当前页面栈长度:')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ bottom: 10 })

      Row() {
        Text(this.currentLength >= 0 ? `${this.currentLength}` : '获取失败')
          .fontSize(36)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.currentLength >= 0 ? '#007dff' : '#f44336')
        
        Text('页面')
          .fontSize(18)
          .fontColor('#666666')
          .margin({ left: 8 })
      }
      .margin({ bottom: 15 })

      // 状态显示
      Text(this.lengthStatus)
        .fontSize(16)
        .fontColor(
          this.lengthStatus.includes('✅') ? '#4caf50' : '#f44336'
        )
        .backgroundColor('#f8f9fa')
        .padding(12)
        .borderRadius(8)
        .margin({ bottom: 20 })
        .width('90%')

      // 测试按钮组
      Button('获取页面栈长度 (getLength)')
        .onClick(() => {
          this.getCurrentLength();
        })
        .id('btn')
        .width('85%')
        .backgroundColor('#007dff')
        .fontColor('#ffffff')

      Button('跳转到目标页面 (pushUrl)')
        .onClick(() => {
          this.pushToTargetPage();
        })
        .width('85%')
        .backgroundColor('#4caf50')
        .fontColor('#ffffff')
        .margin({ top: 8 })

      Button('替换到目标页面 (replaceUrl)')
        .onClick(() => {
          this.replaceToTargetPage();
        })
        .width('85%')
        .backgroundColor('#ff9800')
        .fontColor('#ffffff')
        .margin({ top: 8 })

      Button('多次跳转测试')
        .onClick(() => {
          this.multiplePush();
        })
        .width('85%')
        .backgroundColor('#9c27b0')
        .fontColor('#ffffff')
        .margin({ top: 8 })

      Button('测试返回操作')
        .onClick(() => {
          this.testBackOperation();
        })
        .width('85%')
        .backgroundColor('#f44336')
        .fontColor('#ffffff')
        .margin({ top: 8 })

      Divider()
        .margin({ top: 20, bottom: 15 })

      // 长度变化历史
      Text('栈深度变化历史:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ bottom: 10 })

      Scroll() {
        Text(this.lengthHistory || '暂无历史记录')
          .fontSize(12)
          .textAlign(TextAlign.Start)
          .backgroundColor('#e3f2fd')
          .padding(10)
          .borderRadius(8)
          .width('100%')
          .constraintSize({ minHeight: 80, maxHeight: 120 })
      }
      .width('90%')
      .height('9.84%')

      Divider()
        .margin({ top: 15, bottom: 10 })

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
          .constraintSize({ minHeight: 80, maxHeight: 100 })
      }
      .width('90%')
      .height('8.2%')

      Button('清空日志')
        .onClick(() => {
          this.operationLog = '';
          this.lengthHistory = '';
          this.addLog('日志已清空');
        })
        .width('60%')
        .backgroundColor('#607d7b')
        .fontColor('#ffffff')
        .margin({ top: 10 })

      Divider()
        .margin({ top: 15, bottom: 10 })

      // 功能说明
      Text('功能说明:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. getLength() - 获取当前路由栈中页面数量\n' +
        '2. pushUrl 会使栈深度+1\n' +
        '3. replaceUrl 不改变栈深度\n' +
        '4. back 会使栈深度-1\n' +
        '5. 实时监控栈深度变化')
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
