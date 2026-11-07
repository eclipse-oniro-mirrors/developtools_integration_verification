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

/**
 * 测试用例0190页面
 * Refresh组件嵌套List和自定义文本测试
 */
@Entry
@Component
struct RefreshPromptText03 {
  @State isRefreshing: boolean = false;
  @State arr: string[] = ['项目1', '项目2', '项目3', '项目4', '项目5', '项目6', '项目7', '项目8', '项目9', '项目10'];
  @State refreshOffset: number = 0;
  @State refreshState: RefreshStatus = RefreshStatus.Inactive;

  @Builder
  ListRefreshBuilder() {
    Stack({ alignContent: Alignment.Bottom }) {
      // Refresh嵌套List的自定义文本显示
      if (this.refreshState != RefreshStatus.Inactive) {
        Column() {
          Text('刷新列表')
            .fontSize(16)
            .fontColor(Color.Blue)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 8 });
          
          Text('正在更新列表数据...')
            .fontSize(14)
            .fontColor(Color.Gray)
            .margin({ bottom: 8 });
          
          LoadingProgress()
            .width(24)
            .height(24)
            .color(Color.Blue);
        }
        .width('100%')
        .height('6.56%')
        .backgroundColor(Color.White)
        .borderRadius(8)
        .padding(16)
        .justifyContent(FlexAlign.Center)
        .opacity(this.refreshOffset > 32 ? 1.0 : this.refreshOffset / 32)
      }
    }
    .clip(true)
    .height('100%')
    .width('100%')
  }

  build() {
    Column() {
      // 页面标题
      Text('测试用例0190 - Refresh嵌套List和自定义文本测试')
        .height(50)
        .fontSize(16)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('100%')
        .border({ width: 1 })
        .lineHeight(20)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 8, bottom: 8 });

      // 状态信息显示
      Text(`嵌套List, 自定义文本: "刷新列表", 刷新状态: ${this.isRefreshing ? '刷新中' : '未刷新'}`)
        .height(35)
        .fontSize(12)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('100%')
        .border({ width: 1 })
        .lineHeight(16)
        .fontWeight(300)
        .margin({ bottom: 8 });

      // Refresh测试区域 - 嵌套List并使用自定义文本
      Refresh({ refreshing: $$this.isRefreshing, builder: this.ListRefreshBuilder() }) {
        List() {
          ForEach(this.arr, (item: string) => {
            ListItem() {
              Text(item)
                .width('90%')
                .height(80)
                .fontSize(16)
                .textAlign(TextAlign.Center)
                .backgroundColor(Color.White)
                .borderRadius(10)
                .margin(10)
            }
          }, (item: string) => item)
        }
        .width('100%')
        .height('100%')
        .scrollBar(BarState.Off)
      }
      .width('100%')
      .height('80%')
      .backgroundColor('0xFFE4E1')
      .pullToRefresh(true)
      .refreshOffset(64)

      .onStateChange((refreshStatus: RefreshStatus) => {
        console.info('测试用例0190 Refresh onStateChange:', refreshStatus);
        this.refreshState = refreshStatus;
      })
      .onOffsetChange((value: number) => {
        console.info('测试用例0190 Refresh onOffsetChange:', value);
        this.refreshOffset = value;
      })
      .onRefreshing(() => {
        console.info('测试用例0190 Refresh onRefreshing triggered');
        setTimeout(() => {
          this.isRefreshing = false;
        }, 2000);
      })

      // 控制按钮区域
      Button('开始刷新')
        .id('refreshPromptText03_01')
        .width('80%')
        .height(40)
        .margin({ top: 10 })
        .onClick(() => {
          this.isRefreshing = true;
        });
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
    .padding({ left: 12, right: 12, top: 8, bottom: 8 });
  }
}
