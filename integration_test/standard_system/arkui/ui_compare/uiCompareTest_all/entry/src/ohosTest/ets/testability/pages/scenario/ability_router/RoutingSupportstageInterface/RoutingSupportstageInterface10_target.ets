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
struct RouterTargetPage10 {
  @State receivedParams: string = '';
  @State routerStackInfo: string = '';
  @State operationLog: string = '';

  aboutToAppear() {
    this.loadReceivedParams();
    this.updateRouterStackInfo();
    this.addLog('Router.back 测试目标页面初始化完成');
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

  // 添加操作日志
  addLog(message: string) {
    const timestamp = new Date().toLocaleTimeString();
    this.operationLog = `[${timestamp}] ${message}\n${this.operationLog}`;
  }

  // 基础返回到上一页
  basicBack() {
    this.addLog('执行基础返回操作 router.back()...');
    
    try {
      router.back();
      console.info('基础返回操作已执行');
      this.addLog('基础返回操作已执行');
    } catch (err) {
      console.error('基础返回失败:', JSON.stringify(err));
      this.addLog(`基础返回失败: ${JSON.stringify(err)}`);
    }
  }

  // Promise方式返回
  promiseBack() {
    this.addLog('执行Promise方式返回...');
    
    router.back()
      .then(() => {
        console.info('Promise方式返回成功');
        this.addLog('Promise方式返回成功');
      })
      .catch((err: BusinessError) => {
        console.error('Promise方式返回失败:', JSON.stringify(err));
        this.addLog(`Promise方式返回失败: ${err.message}`);
      });
  }

  // 返回到指定页面
  backToSpecificPage() {
    this.addLog('执行返回到指定页面操作...');
    
    try {
      router.back({
        url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface10'
      });
      console.info('返回到指定页面操作已执行');
      this.addLog('返回到指定页面操作已执行');
    } catch (err) {
      console.error('返回到指定页面失败:', JSON.stringify(err));
      this.addLog(`返回到指定页面失败: ${JSON.stringify(err)}`);
    }
  }

  // Promise方式返回到指定页面
  promiseBackToSpecificPage() {
    this.addLog('执行Promise方式返回到指定页面...');
    
    router.back({
      url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface10'
    }).then(() => {
      console.info('Promise方式返回到指定页面成功');
      this.addLog('Promise方式返回到指定页面成功');
    }).catch((err: BusinessError) => {
      console.error('Promise方式返回到指定页面失败:', JSON.stringify(err));
      this.addLog(`Promise方式返回到指定页面失败: ${err.message}`);
    });
  }

  // 回调方式返回
  callbackBack() {
    this.addLog('执行回调方式返回...');
    
    try {
      router.back(undefined, (err) => {
        if (err) {
          console.error('回调方式返回失败:', JSON.stringify(err));
          this.addLog(`回调方式返回失败: ${err.message}`);
        } else {
          console.info('回调方式返回成功');
          this.addLog('回调方式返回成功');
        }
      });
    } catch (err) {
      console.error('回调方式返回异常:', JSON.stringify(err));
      this.addLog(`回调方式返回异常: ${JSON.stringify(err)}`);
    }
  }

  build() {
    Column() {
      Text('Router back() 目标测试页面')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .fontColor('#e91e63')
        .margin({ bottom: 20 })

      Text('✅ 已成功跳转到目标页面！')
        .fontSize(16)
        .fontColor('#4caf50')
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 15 })

      // 路由栈信息显示
      Text(this.routerStackInfo)
        .fontSize(14)
        .textAlign(TextAlign.Center)
        .backgroundColor('#e8f5e8')
        .padding(15)
        .borderRadius(10)
        .margin({ bottom: 15 })
        .width('90%')

      // 接收到的参数显示
      Text(this.receivedParams)
        .fontSize(10)
        .textAlign(TextAlign.Start)
        .backgroundColor('#f5f5f5')
        .padding(10)
        .borderRadius(8)
        .margin({ bottom: 20 })
        .width('90%')
        .constraintSize({ maxHeight: 80 })

      // 各种返回方式测试按钮
      Button('基础返回 (router.back)')
        .onClick(() => {
          this.basicBack();
        })
        .width('85%')
        .backgroundColor('#f44336')
        .fontColor('#ffffff')

      Button('Promise方式返回')
        .onClick(() => {
          this.promiseBack();
        })
        .width('85%')
        .backgroundColor('#9c27b0')
        .fontColor('#ffffff')
        .margin({ top: 8 })

      Button('回调方式返回')
        .onClick(() => {
          this.callbackBack();
        })
        .width('85%')
        .backgroundColor('#ff5722')
        .fontColor('#ffffff')
        .margin({ top: 8 })

      Button('返回到指定页面')
        .onClick(() => {
          this.backToSpecificPage();
        })
        .width('85%')
        .backgroundColor('#3f51b5')
        .fontColor('#ffffff')
        .margin({ top: 8 })

      Button('Promise返回到指定页面')
        .onClick(() => {
          this.promiseBackToSpecificPage();
        })
        .width('85%')
        .backgroundColor('#009688')
        .fontColor('#ffffff')
        .margin({ top: 8 })

      Button('刷新页面信息')
        .onClick(() => {
          this.loadReceivedParams();
          this.updateRouterStackInfo();
          this.addLog('已刷新页面信息');
        })
        .width('85%')
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
          .constraintSize({ minHeight: 80, maxHeight: 120 })
      }
      .width('90%')
      .height('9.84%')

      // 测试说明
      Text('测试方法说明:')
        .fontSize(12)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ top: 10, bottom: 5 })

      Text('• 基础返回: router.back()\n' +
        '• 指定页面: router.back({url: "xxx"})\n' +
        '• Promise: 使用.then().catch()\n' +
        '• 回调: router.back(options, callback)')
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
