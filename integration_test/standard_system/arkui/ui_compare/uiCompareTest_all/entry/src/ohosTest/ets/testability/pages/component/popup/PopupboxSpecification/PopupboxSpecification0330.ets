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


@Entry
@Component
struct PopupboxSpecification0330 {
  @State isCustomPopupVisible: boolean = false
  @State progress: number = 0
  private timer: number = -1

  build() {
    Column() {
      Button('点击弹出无按钮自定义弹窗')
        .id('popup_button_0330')
        .onClick(() => {
          this.isCustomPopupVisible = true
          this.startProgress()
        })
        .margin({ top: 50 })
      
      if (this.progress > 0) {
        Text(`进度: ${this.progress}%`)
          .fontSize(16)
          .margin({ top: 20 })
      }
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.White)
    .bindContentCover(this.isCustomPopupVisible, this.customPopupDialog, {
      modalTransition: ModalTransition.NONE,
      backgroundColor: Color.Transparent,
      onAppear: () => {
        console.info('Custom popup dialog appeared')
      },
      onDisappear: () => {
        this.isCustomPopupVisible = false
        this.stopProgress()
      }
    })
  }

  @Builder
  customPopupDialog() {
    Column() {
      Text('自定义弹窗')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 15 })
      
      Text('这是一个无按钮自定义弹窗，有蒙层')
        .fontSize(14)
        .textAlign(TextAlign.Center)
        .margin({ bottom: 20 })
      
      // 自定义内容：进度条
      Column() {
        Text('正在处理...')
          .fontSize(16)
          .margin({ bottom: 10 })
        
        Progress({ value: this.progress, total: 100, type: ProgressType.Linear })
          .width('100%')
          .height(8)
          .color(Color.Blue)
          .margin({ bottom: 10 })
        
        Text(`${this.progress}%`)
          .fontSize(14)
          .fontColor(Color.Gray)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#F5F5F5')
      .borderRadius(8)
      .margin({ bottom: 20 })
      
      // 自定义图标和文本
      Row() {
        Text('⚙️')
          .fontSize(24)
          .margin({ right: 10 })
        
        Column() {
          Text('系统正在优化')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
          
          Text('请稍候，不要关闭应用')
            .fontSize(12)
            .fontColor(Color.Gray)
            .margin({ top: 5 })
        }
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .margin({ bottom: 20 })
      
      Text('点击外部区域关闭')
        .fontSize(12)
        .fontColor(Color.Gray)
        .textAlign(TextAlign.Center)
    }
    .width('41.67%')
    .padding(25)
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 15, color: Color.Gray, offsetX: 0, offsetY: 5 })
    .onClick(() => {
      this.isCustomPopupVisible = false
    })
  }

  private startProgress() {
    this.progress = 0
    this.timer = setInterval(() => {
      if (this.progress < 100) {
        this.progress += 2
      } else {
        this.stopProgress()
        this.isCustomPopupVisible = false
      }
    }, 100)
  }

  private stopProgress() {
    if (this.timer !== -1) {
      clearInterval(this.timer)
      this.timer = -1
    }
  }
}
