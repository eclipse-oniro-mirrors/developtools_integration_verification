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

// PageHome1 组件 - 显示在左侧
@Component
export struct PageHome1Content {
  build() {
    Column() {
      Text('PageHome1 页面')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20 })
      
      Text('这是 PageHome1 的内容')
        .fontSize(16)
        .margin({ top: 10 })
        .fontColor('#666666')
      
      Text('(左侧主页面)')
        .fontSize(14)
        .margin({ top: 5 })
        .fontColor('#999999')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#E3F2FD')
  }
}

// PageDetail2 组件 - 显示在右侧
@Component
export struct PageDetail2 {
  build() {
    NavDestination() {
      Column() {
        Text('PageDetail2 页面')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })
        
        Text('这是 PageDetail2 的内容')
          .fontSize(16)
          .margin({ top: 10 })
          .fontColor('#666666')
        
        Text('(右侧详情页面)')
          .fontSize(14)
          .margin({ top: 5 })
          .fontColor('#999999')
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
      .backgroundColor('#FFF3E0')
    }
    .title('PageDetail2')
    .hideTitleBar(false)
  }
}

@Entry
@Component
export struct MultiNavigation0270 {
  @State resultText: string = '结果显示区域';
  @State currentMode: NavigationMode = NavigationMode.Split;
  private navPathStack: NavPathStack = new NavPathStack();

  @Builder
  PageMap(name: string) {
    if (name === 'PageDetail2') {
      PageDetail2()
    }
  }

  build() {
    Column() {
      // 标题栏
      Row() {
        Text('MultiNavigation测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FFFFFF')
      }
      .width('100%')
      .height('4.59%')
      .backgroundColor('#2196F3')
      .justifyContent(FlexAlign.Center)

      // 控制按钮区域
      Column({ space: 6 }) {
        // 结果显示区域
        Text(this.resultText)
          .id('resultText')
          .fontSize(12)
          .fontColor('#333333')
          .width('95%')
          .padding(8)
          .backgroundColor('#F5F5F5')
          .borderRadius(6)
          .height(50)
          .margin({ top: 10 })

        Button('pushPathByName PageDetail2')
          .id('pushPageDetail2Button')
          .fontSize(13)
          .backgroundColor('#2196F3')
          .fontColor('#FFFFFF')
          .width('95%')
          .height(36)
          .onClick(() => {
            try {
              this.navPathStack.pushPathByName('PageDetail2', null);
              this.resultText = '已添加 PageDetail2';
              console.info('[MultiNavigation0270] pushPathByName PageDetail2');
            } catch (error) {
              this.resultText = `错误: ${error}`;
              console.error('[MultiNavigation0270] Error:', error);
            }
          })

        Button('SwitchFullScreen true')
          .id('switchFullScreenTrueButton')
          .fontSize(13)
          .backgroundColor('#4CAF50')
          .fontColor('#FFFFFF')
          .width('95%')
          .height(36)
          .onClick(() => {
            try {
              // 切换到全屏模式(Stack模式)
              this.currentMode = NavigationMode.Stack;
              this.resultText = '已设置 SwitchFullScreen true - 页面单栏显示PageDetail2';
              console.info('[MultiNavigation0270] switchFullScreenState true - 切换到Stack模式');
            } catch (error) {
              this.resultText = `错误: ${error}`;
              console.error('[MultiNavigation0270] Error:', error);
            }
          })

        Button('SwitchFullScreen false')
          .id('switchFullScreenFalseButton')
          .fontSize(13)
          .backgroundColor('#FF9800')
          .fontColor('#FFFFFF')
          .width('95%')
          .height(36)
          .onClick(() => {
            try {
              // 切换到分栏模式(Split模式)
              this.currentMode = NavigationMode.Split;
              this.resultText = '已设置 SwitchFullScreen false - 页面左侧显示PageHome1,右侧显示PageDetail2';
              console.info('[MultiNavigation0270] switchFullScreenState false - 切换到Split模式');
            } catch (error) {
              this.resultText = `错误: ${error}`;
              console.error('[MultiNavigation0270] Error:', error);
            }
          })

        Button('SwitchFullScreen undefined')
          .id('switchFullScreenUndefinedButton')
          .fontSize(13)
          .backgroundColor('#9C27B0')
          .fontColor('#FFFFFF')
          .width('95%')
          .height(36)
          .onClick(() => {
            try {
              // 不改变模式
              this.resultText = '已设置 SwitchFullScreen undefined - 界面不发生变化';
              console.info('[MultiNavigation0270] switchFullScreenState undefined - 界面不变');
            } catch (error) {
              this.resultText = `错误: ${error}`;
              console.error('[MultiNavigation0270] Error:', error);
            }
          })

        Button('重置测试')
          .fontSize(13)
          .backgroundColor('#F44336')
          .fontColor('#FFFFFF')
          .width('95%')
          .height(36)
          .onClick(() => {
            try {
              this.navPathStack.clear();
              this.currentMode = NavigationMode.Split;
              this.resultText = '结果显示区域';
              console.info('[MultiNavigation0270] 测试已重置');
            } catch (error) {
              this.resultText = `错误: ${error}`;
              console.error('[MultiNavigation0270] Error:', error);
            }
          })
      }
      .width('100%')
      .padding({ top: 5, bottom: 10 })

      // Navigation 组件区域
      Navigation(this.navPathStack) {
        // 左侧主页面内容 - PageHome1
        PageHome1Content()
      }
      .navDestination(this.PageMap)
      .mode(this.currentMode)
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}
