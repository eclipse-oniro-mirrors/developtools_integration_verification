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
export struct UiComponentNavNavigationAutonegotiation0030 {
  @Provide('pathInfos') pathInfos: NavPathStack = new NavPathStack();

  @Builder
  PageMap(name: string) {
    if (name == 'pageOne') {
      PageOne0030()
    }
  }

  build() {
    Column() {
      Navigation(this.pathInfos) {
        Column() {
          // 标题区域
          Text('测试用例 0030')
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor('#1E88E5')
            .margin({ top: 20, bottom: 10 })
          
          Divider()
            .strokeWidth(2)
            .color('#E3F2FD')
            .margin({ bottom: 15 })
          
          // 测试信息卡片
          Column() {
            Text('📋 测试场景')
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
              .fontColor('#424242')
              .width('100%')
              .margin({ bottom: 8 })
            
            Text('Stack模式存在NavDestination')
              .fontSize(14)
              .fontColor('#757575')
              .width('100%')
              .margin({ left: 10, bottom: 5 })
            
            Text('Navigation高度：auto（自适应）')
              .fontSize(14)
              .fontColor('#757575')
              .width('100%')
              .margin({ left: 10, bottom: 5 })
            
            Text('NavDestination高度：auto（自适应）')
              .fontSize(14)
              .fontColor('#757575')
              .width('100%')
              .margin({ left: 10 })
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#F5F5F5')
          .borderRadius(8)
          .margin({ bottom: 15 })
          
          // 预期效果卡片
          Column() {
            Text('✅ 预期效果')
              .fontSize(16)
              .fontWeight(FontWeight.Medium)
              .fontColor('#2E7D32')
              .width('100%')
              .margin({ bottom: 8 })
            
            Text('NavDestination自适应当前内容高度')
              .fontSize(14)
              .fontColor('#388E3C')
              .width('100%')
              .margin({ left: 10, bottom: 5 })
            
            Text('Navigation自适应NavDestination高度')
              .fontSize(14)
              .fontColor('#388E3C')
              .width('100%')
              .margin({ left: 10, bottom: 5 })
            
            Text('整体布局灵活适应内容变化')
              .fontSize(14)
              .fontColor('#388E3C')
              .width('100%')
              .margin({ left: 10 })
          }
          .width('90%')
          .padding(15)
          .backgroundColor('#E8F5E9')
          .borderRadius(8)
          .margin({ bottom: 20 })
          
          // 操作按钮
          Button('进入NavDestination页面')
            .id('button_autonegotiation_0030_push')
            .fontSize(16)
            .fontColor(Color.White)
            .backgroundColor('#1E88E5')
            .width('80%')
            .height(45)
            .borderRadius(22.5)
            .onClick(() => {
              this.pathInfos.pushPathByName('pageOne', null);
            })
        }
        .width('100%')
        .padding({ left: 20, right: 20 })
      }
      .id('navigation_autonegotiation_0030')
      .mode(NavigationMode.Stack)
      .height('auto')
      .navDestination(this.PageMap)
      .title('Stack模式-Nav和NavDest均auto')
      .titleMode(NavigationTitleMode.Mini)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FAFAFA')
  }
}

@Component
export struct PageOne0030 {
  @Consume('pathInfos') pathInfos: NavPathStack;

  build() {
    NavDestination() {
      Column() {
        // 页面标题
        Text('NavDestination页面')
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
          .fontColor('#1E88E5')
          .margin({ top: 20, bottom: 20 })
        
        // 内容说明
        Column() {
          Text('📄 页面说明')
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor('#424242')
            .width('100%')
            .margin({ bottom: 10 })
          
          Text('高度设置：auto（自适应）')
            .fontSize(14)
            .fontColor('#1E88E5')
            .fontWeight(FontWeight.Medium)
            .width('100%')
            .margin({ left: 10, bottom: 8 })
          
          Text('此NavDestination和父容器Navigation都设置为auto，实现双向自适应。NavDestination根据内容调整高度，Navigation再根据NavDestination调整高度。')
            .fontSize(14)
            .fontColor('#757575')
            .lineHeight(22)
            .width('100%')
        }
        .width('90%')
        .padding(15)
        .backgroundColor('#E3F2FD')
        .borderRadius(8)
        .margin({ bottom: 30 })
        
        // 返回按钮
        Button('返回上一页')
          .fontSize(16)
          .fontColor(Color.White)
          .backgroundColor('#FF6B6B')
          .width('70%')
          .height(45)
          .borderRadius(22.5)
          .onClick(() => {
            this.pathInfos.pop();
          })
      }
      .width('100%')
      .height('100%')
      .padding(20)
      .backgroundColor('#FAFAFA')
    }
    .height('auto')
    .title('NavDestination-高度auto')
    .backgroundColor(Color.White)
  }
}
