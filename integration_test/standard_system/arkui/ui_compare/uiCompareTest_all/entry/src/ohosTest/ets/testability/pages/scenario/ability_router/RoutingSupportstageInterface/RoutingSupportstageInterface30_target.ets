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

@Entry
@Component
struct RouterTargetPage30 {
  @State currentLength: number = 0;
  @State beforeLength: number = 0;
  @State operation: string = '';
  @State receivedParams: string = '';
  @State operationLog: string = '';
  @State lengthComparison: string = '';

  aboutToAppear() {
    this.loadReceivedParams();
    this.getCurrentLength();
    this.addLog('getLength 测试目标页面初始化完成');
  }

  // 加载接收到的参数
  loadReceivedParams() {
    try {
      const params = router.getParams();
      if (params) {
        this.beforeLength = params['beforeLength'] || 0;
        this.operation = params['operation'] || '未知操作';
        this.receivedParams = `接收到的参数：\n${JSON.stringify(params, null, 2)}`;
        console.info('目标页面接收到参数:', JSON.stringify(params));
        this.addLog(`成功接收参数，来源操作: ${this.operation}`);
      } else {
        this.receivedParams = '未接收到任何参数';
        this.addLog('未接收到任何参数');
      }
    } catch (err) {
      this.receivedParams = '获取参数失败';
      this.addLog('获取参数失败');
      console.error('获取参数失败:', JSON.stringify(err));
    }
  }

  // 获取当前页面栈长度
  getCurrentLength() {
    try {
      const length = router.getLength();
      this.currentLength = length;
      
      // 比较跳转前后的长度变化
      this.updateLengthComparison();
      
      console.info(`目标页面 router.getLength() 返回值: ${length}`);
      this.addLog(`当前页面栈长度: ${length}`);
      
    } catch (err) {
      this.currentLength = -1;
      console.error('getLength() 调用失败:', JSON.stringify(err));
      this.addLog(`获取页面栈长度失败: ${JSON.stringify(err)}`);
    }
  }

  // 更新长度对比信息
  updateLengthComparison() {
    if (this.beforeLength > 0) {
      const difference = this.currentLength - this.beforeLength;
      
      if (difference > 0) {
        this.lengthComparison = `✅ 栈深度增加了 ${difference} 层 (${this.beforeLength} → ${this.currentLength})`;
      } else if (difference === 0) {
        this.lengthComparison = `⚪ 栈深度保持不变 (${this.beforeLength} → ${this.currentLength})`;
      } else {
        this.lengthComparison = `📉 栈深度减少了 ${Math.abs(difference)} 层 (${this.beforeLength} → ${this.currentLength})`;
      }
    } else {
      this.lengthComparison = `当前栈深度: ${this.currentLength}`;
    }
  }

  // 添加操作日志
  addLog(message: string) {
    const timestamp = new Date().toLocaleTimeString();
    this.operationLog = `[${timestamp}] ${message}\n${this.operationLog}`;
  }

  // 继续跳转到自己，测试栈深度累积
  continuePush() {
    this.addLog('继续跳转到自己，测试栈深度累积...');
    
    const currentLength = this.currentLength;
    
    router.pushUrl({
      url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface30_target',
      params: {
        fromPage: 'RoutingSupportstageInterface30_target',
        beforeLength: currentLength,
        testId: 30,
        operation: 'continuePush',
        level: currentLength + 1,
        timestamp: Date.now()
      }
    }).then(() => {
      console.info('继续跳转成功');
      this.addLog(`继续跳转成功，跳转前栈长度: ${currentLength}`);
    }).catch((err: BusinessError) => {
      console.error('继续跳转失败:', JSON.stringify(err));
      this.addLog(`继续跳转失败: ${err.message}`);
    });
  }

  // 返回上一页并观察栈深度变化
  goBackAndCheck() {
    this.addLog(`准备返回上一页，当前栈长度: ${this.currentLength}`);
    
    try {
      router.back();
      console.info('返回操作已执行');
      this.addLog('返回操作已执行');
    } catch (err) {
      console.error('返回失败:', JSON.stringify(err));
      this.addLog(`返回失败: ${JSON.stringify(err)}`);
    }
  }

  // 返回到主页面
  backToMainPage() {
    this.addLog('准备返回到主页面...');
    
    router.back({
      url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface30'
    }).then(() => {
      console.info('返回到主页面成功');
      this.addLog('返回到主页面成功');
    }).catch((err: BusinessError) => {
      console.error('返回到主页面失败:', JSON.stringify(err));
      this.addLog(`返回到主页面失败: ${err.message}`);
    });
  }

  // 替换到自己，测试栈深度不变
  replaceSelf() {
    this.addLog('替换到自己，测试栈深度是否保持不变...');
    
    const currentLength = this.currentLength;
    
    router.replaceUrl({
      url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface30_target',
      params: {
        fromPage: 'RoutingSupportstageInterface30_target',
        beforeLength: currentLength,
        testId: 30,
        operation: 'replaceSelf',
        timestamp: Date.now()
      }
    }).then(() => {
      console.info('替换操作成功');
      this.addLog(`替换操作成功，替换前栈长度: ${currentLength}`);
    }).catch((err: BusinessError) => {
      console.error('替换操作失败:', JSON.stringify(err));
      this.addLog(`替换操作失败: ${err.message}`);
    });
  }

  build() {
    Column() {
      Text('getLength 测试目标页面')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor('#007dff')
        .margin({ bottom: 15 })

      Text('✅ 跳转成功！正在验证栈深度变化')
        .fontSize(16)
        .fontColor('#4caf50')
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 15 })

      // 操作类型显示
      if (this.operation !== '') {
        Text(`来源操作: ${this.operation}`)
          .fontSize(14)
          .fontColor('#e91e63')
          .fontWeight(FontWeight.Medium)
          .backgroundColor('#fce4ec')
          .padding(8)
          .borderRadius(6)
          .margin({ bottom: 15 })
      }

      // 当前栈长度显示
      Row() {
        Text('当前栈深度:')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
        
        Text(`${this.currentLength >= 0 ? this.currentLength : '获取失败'}`)
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor('#007dff')
          .margin({ left: 10 })
        
        Text('页面')
          .fontSize(16)
          .fontColor('#666666')
          .margin({ left: 5 })
      }
      .margin({ bottom: 15 })

      // 长度变化对比
      Text(this.lengthComparison)
        .fontSize(14)
        .fontColor(
          this.lengthComparison.includes('✅') ? '#4caf50' : 
          this.lengthComparison.includes('📉') ? '#f44336' : '#ff9800'
        )
        .backgroundColor('#f8f9fa')
        .padding(10)
        .borderRadius(8)
        .margin({ bottom: 15 })
        .width('90%')

      // 操作按钮
      Button('刷新栈长度信息')
        .onClick(() => {
          this.getCurrentLength();
          this.addLog('已刷新栈长度信息');
        })
        .width('80%')
        .backgroundColor('#007dff')
        .fontColor('#ffffff')

      Button('继续跳转 (pushUrl)')
        .onClick(() => {
          this.continuePush();
        })
        .width('80%')
        .backgroundColor('#4caf50')
        .fontColor('#ffffff')
        .margin({ top: 8 })

      Button('替换到自己 (replaceUrl)')
        .onClick(() => {
          this.replaceSelf();
        })
        .width('80%')
        .backgroundColor('#ff9800')
        .fontColor('#ffffff')
        .margin({ top: 8 })

      Button('返回上一页 (back)')
        .onClick(() => {
          this.goBackAndCheck();
        })
        .width('80%')
        .backgroundColor('#f44336')
        .fontColor('#ffffff')
        .margin({ top: 8 })

      Button('返回到主页面')
        .onClick(() => {
          this.backToMainPage();
        })
        .width('80%')
        .backgroundColor('#9c27b0')
        .fontColor('#ffffff')
        .margin({ top: 8 })

      Divider()
        .margin({ top: 15, bottom: 10 })

      // 接收到的参数显示
      Text('接收到的参数:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ bottom: 8 })

      Scroll() {
        Text(this.receivedParams)
          .fontSize(10)
          .textAlign(TextAlign.Start)
          .backgroundColor('#f5f5f5')
          .padding(8)
          .borderRadius(6)
          .width('100%')
      }
      .width('90%')
      .height('8.2%')
      .margin({ bottom: 15 })

      // 操作日志区域
      Text('操作日志:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ bottom: 8 })

      Scroll() {
        Text(this.operationLog || '暂无操作记录')
          .fontSize(11)
          .textAlign(TextAlign.Start)
          .backgroundColor('#f9f9f9')
          .padding(8)
          .borderRadius(6)
          .width('100%')
          .constraintSize({ minHeight: 80, maxHeight: 120 })
      }
      .width('90%')
      .height('9.84%')

      // 验证说明
      Text('验证项目:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ top: 10, bottom: 5 })

      Text('• pushUrl: 栈深度应该+1\n' +
        '• replaceUrl: 栈深度保持不变\n' +
        '• back: 栈深度应该-1\n' +
        '• getLength(): 返回正确的栈深度值')
        .fontSize(10)
        .fontColor('#666666')
        .textAlign(TextAlign.Start)
        .alignSelf(ItemAlign.Start)
        .lineHeight(15)

    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .padding(15)
    .scrollable(ScrollDirection.Vertical)
  }
}
