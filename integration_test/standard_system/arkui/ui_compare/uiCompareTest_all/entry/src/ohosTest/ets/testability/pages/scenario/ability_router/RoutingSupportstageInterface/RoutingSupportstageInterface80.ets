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
struct RouterPage80 {
  @State alertStatus: string = '返回询问对话框未启用';
  @State operationLog: string = '';
  @State isAlertEnabled: boolean = false;

  aboutToAppear() {
    this.addLog('页面初始化完成');
  }

  // 添加操作日志
  addLog(message: string) {
    const timestamp = new Date().toLocaleTimeString();
    this.operationLog = `[${timestamp}] ${message}\n${this.operationLog}`;
  }

  // 启用返回询问对话框
  enableBackAlert() {
    try {
      router.enableAlertBeforeBackPage({
        message: '确定要离开此页面吗？此操作将丢失未保存的数据。'
      });
      
      this.alertStatus = '✅ 返回询问对话框已启用';
      this.isAlertEnabled = true;
      this.addLog('成功启用返回询问对话框');
      console.info('enableAlertBeforeBackPage 调用成功');
      
    } catch (err) {
      this.alertStatus = '❌ 启用返回询问对话框失败';
      this.isAlertEnabled = false;
      this.addLog(`启用返回询问对话框失败: ${JSON.stringify(err)}`);
      console.error('enableAlertBeforeBackPage 调用失败:', JSON.stringify(err));
    }
  }

  // 启用自定义消息的返回询问对话框
  enableCustomAlert() {
    try {
      router.enableAlertBeforeBackPage({
        message: '您正在进行重要操作，确认离开吗？\n\n• 未保存的更改将丢失\n• 当前进度不会保存\n\n请谨慎选择！'
      });
      
      this.alertStatus = '✅ 自定义返回询问对话框已启用';
      this.isAlertEnabled = true;
      this.addLog('成功启用自定义返回询问对话框');
      console.info('enableAlertBeforeBackPage (自定义消息) 调用成功');
      
    } catch (err) {
      this.alertStatus = '❌ 启用自定义返回询问对话框失败';
      this.isAlertEnabled = false;
      this.addLog(`启用自定义返回询问对话框失败: ${JSON.stringify(err)}`);
      console.error('enableAlertBeforeBackPage (自定义消息) 调用失败:', JSON.stringify(err));
    }
  }

  // 禁用返回询问对话框
  disableBackAlert() {
    try {
      router.disableAlertBeforeBackPage();
      
      this.alertStatus = '⚪ 返回询问对话框已禁用';
      this.isAlertEnabled = false;
      this.addLog('成功禁用返回询问对话框');
      console.info('disableAlertBeforeBackPage 调用成功');
      
    } catch (err) {
      this.alertStatus = '❌ 禁用返回询问对话框失败';
      this.addLog(`禁用返回询问对话框失败: ${JSON.stringify(err)}`);
      console.error('disableAlertBeforeBackPage 调用失败:', JSON.stringify(err));
    }
  }

  // 测试返回功能
  testBackNavigation() {
    this.addLog('准备测试返回功能...');
    
    try {
      router.back();
      this.addLog('返回操作已执行');
      console.info('返回操作已执行');
    } catch (err) {
      this.addLog(`返回操作失败: ${JSON.stringify(err)}`);
      console.error('返回操作失败:', JSON.stringify(err));
    }
  }

  build() {
    Column() {
      Text('Router enableAlertBeforeBackPage 接口测试')
        .fontSize(22)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 20 })

      // 状态显示区域
      Text(this.alertStatus)
        .fontSize(16)
        .fontColor(
          this.alertStatus.includes('✅') ? '#4caf50' : 
          this.alertStatus.includes('❌') ? '#f44336' : '#ff9800'
        )
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
        .backgroundColor('#f8f9fa')
        .padding(15)
        .borderRadius(10)
        .margin({ bottom: 20 })
        .width('90%')

      // 主要功能按钮
      Button('启用返回询问对话框')
        .onClick(() => {
          this.enableBackAlert();
        })
        .id('btn')
        .width('85%')
        .backgroundColor('#007dff')
        .fontColor('#ffffff')

      Button('启用自定义消息对话框')
        .onClick(() => {
          this.enableCustomAlert();
        })
        .width('85%')
        .backgroundColor('#4caf50')
        .fontColor('#ffffff')
        .margin({ top: 10 })

      Button('禁用返回询问对话框')
        .onClick(() => {
          this.disableBackAlert();
        })
        .width('85%')
        .backgroundColor('#ff9800')
        .fontColor('#ffffff')
        .margin({ top: 10 })

      Button('测试返回功能')
        .onClick(() => {
          this.testBackNavigation();
        })
        .width('85%')
        .backgroundColor(this.isAlertEnabled ? '#e91e63' : '#9e9e9e')
        .fontColor('#ffffff')
        .margin({ top: 15 })

      Divider()
        .margin({ top: 20, bottom: 15 })

      // 状态指示器
      Row() {
        Text('当前状态: ')
          .fontSize(14)
          .fontWeight(FontWeight.Medium)
        
        Text(this.isAlertEnabled ? '已启用询问对话框' : '未启用询问对话框')
          .fontSize(14)
          .fontColor(this.isAlertEnabled ? '#4caf50' : '#757575')
          .fontWeight(FontWeight.Medium)
      }
      .margin({ bottom: 15 })

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

      // 功能说明
      Text('功能说明:')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .alignSelf(ItemAlign.Start)

      Text('1. enableAlertBeforeBackPage() - 启用返回询问对话框\n' +
        '2. disableAlertBeforeBackPage() - 禁用返回询问对话框\n' +
        '3. 支持自定义提示消息内容\n' +
        '4. 启用后返回时会弹出确认对话框\n' +
        '5. 用户可选择确认返回或取消操作')
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
