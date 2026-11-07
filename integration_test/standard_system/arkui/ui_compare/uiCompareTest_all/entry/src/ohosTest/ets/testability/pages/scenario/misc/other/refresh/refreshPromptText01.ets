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
 * 测试用例0140页面
 * Refresh组件自定义builder刷新组件和自定义文本测试
 */
@Entry
@Component
struct RefreshPromptText01 {
  @State isRefreshing: boolean = false;
  @State arr: string[] = ['项目1', '项目2', '项目3', '项目4', '项目5', '项目6', '项目7', '项目8', '项目9', '项目10'];
  @State refreshOffset: number = 0;
  @State refreshState: RefreshStatus = RefreshStatus.Inactive;

  @Builder
  CustomRefreshBuilder() {
    Stack({ alignContent: Alignment.Bottom }) {
      // 可以通过刷新状态控制是否存在Progress组件
      if (this.refreshState != RefreshStatus.Inactive && this.refreshState != RefreshStatus.Done) {
        Column() {
          Text('自定义刷新组件')
            .fontSize(16)
            .fontColor(Color.Blue)
            .fontWeight(FontWeight.Bold)
            .margin({ bottom: 8 });
          
          Text('正在刷新数据...')
            .fontSize(14)
            .fontColor(Color.Gray)
            .margin({ bottom: 8 });
          
          Progress({ value: this.refreshOffset, total: 64, type: ProgressType.Ring })
            .width(32)
            .height(32)
            .style({ status: this.isRefreshing ? ProgressStatus.LOADING : ProgressStatus.PROGRESSING })
            .color(Color.Blue);
        }
        .width('100%')
        .height('6.56%')
        .backgroundColor(Color.White)
        .borderRadius(8)
        .padding(16)
        .justifyContent(FlexAlign.Center)
      }
    }
    .clip(true)
    .height('100%')
    .width('100%')
  }

  build() {
    Column() {
      // 页面标题
      Text('测试用例0140 - 自定义builder刷新组件测试')
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
      Text(`自定义刷新组件, 刷新状态: ${this.isRefreshing ? '刷新中' : '未刷新'}`)
        .height(35)
        .fontSize(12)
        .textAlign(TextAlign.Center)
        .fontColor(Color.Black)
        .width('100%')
        .border({ width: 1 })
        .lineHeight(16)
        .fontWeight(300)
        .margin({ bottom: 8 });

      // Refresh测试区域 - 使用自定义builder刷新组件
      Refresh({ refreshing: $$this.isRefreshing, builder: this.CustomRefreshBuilder() }) {
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
        console.info('测试用例0140 Refresh onStateChange:', refreshStatus);
        this.refreshState = refreshStatus;
      })
      .onOffsetChange((value: number) => {
        console.info('测试用例0140 Refresh onOffsetChange:', value);
        this.refreshOffset = value;
      })
      .onRefreshing(() => {
        console.info('测试用例0140 Refresh onRefreshing triggered');
        setTimeout(() => {
          this.isRefreshing = false;
        }, 2000);
      })

      // 控制按钮区域
      Button('开始刷新')
        .id('refreshPromptText01_01')
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
