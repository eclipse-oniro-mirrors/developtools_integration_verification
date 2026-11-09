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

import { UIContext } from '@kit.ArkUI';

@Entry
@Component
struct AtomicserviceCapsulePosition0010 {
  @State barRectInfo: string = '未获取';
  @State errorInfo: string = '';
  private uiContext: UIContext | null = null;

  aboutToAppear(): void {
    try {
      this.uiContext = this.getUIContext();
    } catch (error) {
      this.errorInfo = `获取UIContext失败: ${JSON.stringify(error)}`;
      console.error('获取UIContext失败:', error);
    }
  }

  getBarRectInfo(): void {
    try {
      if (this.uiContext) {
        const atomicServiceBar = this.uiContext.getAtomicServiceBar();
        if (atomicServiceBar) {
          const barRect = atomicServiceBar.getBarRect();
          if (barRect) {
            this.barRectInfo = `X: ${barRect.x}, Y: ${barRect.y}, Width: ${barRect.width}, Height: ${barRect.height}`;
            this.errorInfo = '';
            console.info('getBarRect调用成功:', JSON.stringify(barRect));
          } else {
            this.barRectInfo = 'getBarRect返回null';
            console.warn('getBarRect返回null');
          }
        } else {
          this.barRectInfo = 'AtomicServiceBar不可用';
          console.warn('AtomicServiceBar不可用');
        }
      } else {
        this.errorInfo = 'UIContext未初始化';
        console.error('UIContext未初始化');
      }
    } catch (error) {
      this.errorInfo = `调用getBarRect失败: ${JSON.stringify(error)}`;
      console.error('调用getBarRect失败:', error);
    }
  }

  build() {
    Column({ space: 20 }) {
      Text('getBarRect接口测试')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })

      Divider()

      // 显示Bar矩形信息
      Text('Bar矩形信息:')
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
      
      Text(this.barRectInfo)
        .fontSize(16)
        .fontColor(Color.Blue)
        .margin({ top: 10 })

      // 显示错误信息
      if (this.errorInfo) {
        Text('错误信息:')
          .fontSize(18)
          .fontWeight(FontWeight.Medium)
          .fontColor(Color.Red)
          .margin({ top: 20 })
        
        Text(this.errorInfo)
          .fontSize(14)
          .fontColor(Color.Red)
          .margin({ top: 10 })
      }

      Divider()
        .margin({ top: 20 })

      // 调用getBarRect的按钮
      Button('调用getBarRect接口')
        .fontSize(16)
        .width('80%')
        .height(50)
        .margin({ top: 20 })
        .onClick(() => {
          this.getBarRectInfo();
        })

      // 说明文本
      Text('点击按钮调用getBarRect接口获取原子化服务胶囊的位置信息')
        .fontSize(14)
        .fontColor(Color.Gray)
        .margin({ top: 20 })
        .textAlign(TextAlign.Center)
        .width('90%')
    }
    .width('100%')
    .height('100%')
    .padding(20)
    .backgroundColor(Color.White)
  }
}
