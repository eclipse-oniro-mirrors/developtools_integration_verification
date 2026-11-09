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
struct RouterPage50 {
  @State currentState: string = '';
  @State stateDetails: string = '';
  @State operationLog: string = '';

  aboutToAppear() {
    this.getPageState();
    this.addLog('页面初始化完成');
  }

  // 获取当前页面状态
  getPageState() {
    try {
      const state = router.getState();
      this.currentState = `页面状态获取成功`;
      
      // 格式化状态信息显示
      this.stateDetails = `页面名称: ${state.name || '未设置'}\n` +
        `页面路径: ${state.path || '未知路径'}\n` +
        `页面索引: ${state.index !== undefined ? state.index : '未知'}\n` +
        `完整状态: ${JSON.stringify(state, null, 2)}`;
      
      console.info('getState()获取到的页面状态:', JSON.stringify(state));
      this.addLog(`成功获取页面状态: ${state.name || '未命名'}`);
      
    } catch (err) {
      this.currentState = '获取页面状态失败';
      this.stateDetails = `错误信息: ${JSON.stringify(err)}`;
      console.error('getState()调用失败:', JSON.stringify(err));
      this.addLog('获取页面状态失败');
    }
  }

  // 添加操作日志
  addLog(message: string) {
    const timestamp = new Date().toLocaleTimeString();
    this.operationLog = `[${timestamp}] ${message}\n${this.operationLog}`;
  }

  build() {
    Column() {
      Text('Router getState() 接口测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      // 状态显示区域
      Text(this.currentState)
        .fontSize(18)
        .fontColor(this.currentState.includes('成功') ? '#4caf50' : '#f44336')
        .fontWeight(FontWeight.Medium)
        .margin({ bottom: 15 })

      // 状态详细信息
      Text('页面状态详细信息:')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)
        .margin({ bottom: 10 })

      Text(this.stateDetails)
        .fontSize(12)
        .textAlign(TextAlign.Start)
        .backgroundColor('#f5f5f5')
        .padding(15)
        .borderRadius(10)
        .margin({ bottom: 20 })
        .width('90%')

      // 操作按钮
      Button('获取页面状态 (getState)')
        .onClick(() => {
          this.getPageState();
        })
        .id('btn')
        .width('80%')
        .backgroundColor('#007dff')
        .fontColor('#ffffff')

      Button('带参数跳转到自己')
        .onClick(() => {
          this.addLog('准备带参数跳转到当前页面');
          
          router.replaceUrl({
            url: 'testability/pages/RoutingSupportstageInterface/RoutingSupportstageInterface50',
            params: {
              testParam: 'getState测试参数',
              timestamp: Date.now(),
              counter: Math.floor(Math.random() * 100),
              testObject: {
                name: 'OpenHarmony',
                version: '5.0',
                feature: 'router.getState()'
              }
            }
          }).then(() => {
            console.info('带参数跳转成功');
            this.addLog('带参数跳转成功，状态已更新');
            // 跳转后重新获取状态
            setTimeout(() => {
              this.getPageState();
            }, 100);
          }).catch((err: BusinessError) => {
            console.error('带参数跳转失败:', JSON.stringify(err));
            this.addLog(`带参数跳转失败: ${err.message}`);
          });
        })
        .width('80%')
        .backgroundColor('#4caf50')
        .fontColor('#ffffff')
        .margin({ top: 10 })

      Button('获取传入参数')
        .onClick(() => {
          try {
            const params = router.getParams();
            if (params && Object.keys(params).length > 0) {
              this.addLog(`接收到参数: ${JSON.stringify(params)}`);
              console.info('getParams()获取到参数:', JSON.stringify(params));
            } else {
              this.addLog('未接收到任何参数');
            }
          } catch (err) {
            this.addLog('获取参数失败');
            console.error('getParams()调用失败:', JSON.stringify(err));
          }
        })
        .width('80%')
        .backgroundColor('#ff9800')
        .fontColor('#ffffff')
        .margin({ top: 10 })

      Button('清空操作日志')
        .onClick(() => {
          this.operationLog = '';
          this.addLog('日志已清空');
        })
        .width('80%')
        .backgroundColor('#9e9e9e')
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
          .constraintSize({ minHeight: 100, maxHeight: 150 })
      }
      .width('90%')
      .height('12.3%')

      Divider()
        .margin({ top: 15, bottom: 10 })

      // 使用说明
      Text('功能说明:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. getState() - 获取当前页面状态信息\n' +
        '2. 支持获取页面名称、路径、索引等\n' +
        '3. 可以检测页面参数变化\n' +
        '4. 实时显示状态更新')
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
