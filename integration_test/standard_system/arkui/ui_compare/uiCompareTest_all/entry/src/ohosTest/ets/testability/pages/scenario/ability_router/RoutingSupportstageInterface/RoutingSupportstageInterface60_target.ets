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
struct RouterTargetPage60 {
  @State receivedParams: string = '';
  @State routerStackInfo: string = '';
  @State testType: string = '';
  @State operationLog: string = '';

  aboutToAppear() {
    this.loadReceivedParams();
    this.updateRouterStackInfo();
    this.addLog('pushUrl 跳转目标页面初始化完成');
  }

  // 加载接收到的参数
  loadReceivedParams() {
    try {
      const params = router.getParams();
      if (params) {
        this.testType = params['testType'] || '未知测试类型';
        this.receivedParams = `接收到的参数：\n${JSON.stringify(params, null, 2)}`;
        console.info('pushUrl 目标页面接收到参数:', JSON.stringify(params));
        this.addLog(`成功接收参数，测试类型: ${this.testType}`);
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

  // 继续pushUrl到自己（测试多层跳转）
  continuePushUrl() {
    this.addLog('继续 pushUrl 到自己...');
    
    router.pushUrl({
      url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface60_target',
      params: {
        fromPage: 'RoutingSupportstageInterface60_target',
        testType: '多层pushUrl',
        testId: 60,
        level: (router.getLength() + 1),
        timestamp: Date.now(),
        data: {
          title: '多层跳转测试',
          description: '这是多层pushUrl跳转测试',
          currentLevel: router.getLength()
        }
      }
    }).then(() => {
      console.info('继续 pushUrl 跳转成功');
      this.addLog('继续 pushUrl 跳转成功');
    }).catch((err: BusinessError) => {
      console.error('继续 pushUrl 跳转失败:', JSON.stringify(err));
      this.addLog(`继续 pushUrl 跳转失败: ${err.message}`);
    });
  }

  // 返回到上一页
  goBack() {
    this.addLog('准备返回上一页...');
    
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
      url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface60'
    }).then(() => {
      console.info('返回到主页面成功');
      this.addLog('返回到主页面成功');
    }).catch((err: BusinessError) => {
      console.error('返回到主页面失败:', JSON.stringify(err));
      this.addLog(`返回到主页面失败: ${err.message}`);
    });
  }

  build() {
    Column() {
      Text('pushUrl 跳转目标页面')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor('#007dff')
        .margin({ bottom: 15 })

      Text('✅ pushUrl 跳转成功！')
        .fontSize(18)
        .fontColor('#4caf50')
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 15 })

      // 测试类型显示
      if (this.testType !== '') {
        Text(`测试类型: ${this.testType}`)
          .fontSize(16)
          .fontColor('#e91e63')
          .fontWeight(FontWeight.Medium)
          .backgroundColor('#fce4ec')
          .padding(10)
          .borderRadius(8)
          .margin({ bottom: 15 })
      }

      // 路由栈信息显示
      Text('当前路由栈信息:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ bottom: 8 })

      Text(this.routerStackInfo)
        .fontSize(12)
        .textAlign(TextAlign.Center)
        .backgroundColor('#e8f5e8')
        .padding(12)
        .borderRadius(8)
        .margin({ bottom: 15 })
        .width('90%')

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
          .padding(10)
          .borderRadius(8)
          .width('100%')
      }
      .width('90%')
      .height('9.84%')
      .margin({ bottom: 15 })

      // 操作按钮
      Button('继续 pushUrl 到自己')
        .onClick(() => {
          this.continuePushUrl();
        })
        .width('80%')
        .backgroundColor('#ff9800')
        .fontColor('#ffffff')

      Button('返回上一页 (back)')
        .onClick(() => {
          this.goBack();
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

      Button('刷新页面信息')
        .onClick(() => {
          this.loadReceivedParams();
          this.updateRouterStackInfo();
          this.addLog('已刷新页面信息');
        })
        .width('80%')
        .backgroundColor('#607d7b')
        .fontColor('#ffffff')
        .margin({ top: 15 })

      Divider()
        .margin({ top: 15, bottom: 10 })

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
          .constraintSize({ minHeight: 80, maxHeight: 100 })
      }
      .width('90%')
      .height('8.2%')

      // 验证说明
      Text('验证项目:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ top: 10, bottom: 5 })

      Text('• 成功跳转到目标页面\n' +
        '• 正确接收传递的参数\n' +
        '• 路由栈深度正确增加\n' +
        '• 保留了上一页面状态')
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

