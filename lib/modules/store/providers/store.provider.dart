import 'package:paily/modules/store/enums/store_type.enum.dart';
import 'package:paily/modules/store/models/store.model.dart';
import 'package:paily/modules/store/models/store_product.model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'store.provider.g.dart';

final mockup = [
  Store(
    id: '1',
    name: 'Lady Buddha',
    description: 'Linh Ung Pagoda is a renowned spiritual destination located in Da Nang, Vietnam. Perched on Son Tra Peninsula, it offers breathtaking panoramic views of the city, sea, and mountains. The pagoda is famous for its 67-meter-tall Lady Buddha statue, the tallest in Vietnam, symbolizing peace and protection for fishermen. Surrounded by lush greenery and a serene atmosphere, Linh Ung Pagoda blends traditional Buddhist architecture with modern elements. It’s a must-visit site for those seeking tranquility, cultural exploration, and spectacular natural beauty.',
    imageUrls: ['https://dynamic-media-cdn.tripadvisor.com/media/photo-o/10/14/44/78/the-lady-buddha.jpg?w=1600&h=900&s=1'],
    lat: 16.099652,
    lng: 108.277082,
    address: 'Lam Thi Ni Garden, Hoang Sa, Tho Quang, Son Tra, Da Nang, Vietnam', 
    type: EStoreType.landscape,
  ),
  Store(
    id: '2',
    name: 'Dragon Bridge',
    description: 'This 2,185-foot-long bridge shaped like an undulating golden dragon is the most famous bridge over the Han River in downtown Danang. On weekend nights, the dragon comes to life in quite an unusual way: the bridge is closed to traffic, and the massive dragon head on the east end of the bridge releases bursts of flames and water in a spectacular night show. Prepare to get wet if you stand on the bridge near the head. Otherwise, you can view the spectacle from the river bank along Tran Hung Dao Street or many of the nearby rooftop bars. The bridge is usually a stop on a night tour of Da Nang.',
    imageUrls: ['https://static.vinwonders.com/2022/04/cau-rong-da-nang-1-1.jpg'],
    lat: 16.0612215,
    lng: 108.2296818, 
    address: 'Nguyen Van Linh, Phuoc Ninh, Hai Chau, Da Nang, Vietnam', 
    type: EStoreType.landscape,
  ),
  Store(
    id: '3',
    name: 'Ba Na Hills',
    description: 'Ba Na is a nature reserve as well as a resort tourist complex located in the area of Truong Son range located in Hoa Ninh commune, Hoa Vang District, about 25km southwest of the center of Da Nang. The entire resort complex is located on the top of God\'s Mountain with an altitude of 1487 m above sea level.',
    imageUrls: ['https://vietnam.travel/sites/default/files/inline-images/shutterstock_1346056832.jpg'],
    miniAppUrl: 'https://booking.sunworld.vn/catalog?startDate=2025-01-17&endDate=2025-02-16&park=15152',
    website: 'https://banahills.sunworld.vn/',
    lat: 15.995028,
    lng: 107.996193, 
    address: 'An Son Village, Hoa Vang, Da Nang, Vietnam', 
    type: EStoreType.park,
    priceFromLocalCur: 49.9,
    services: [
      StoreProduct(
        id: '1',
        name: 'CABLE CAR TICKET',
        priceLocalCur: 36.9,
        imageUrl: 'https://static.sunworld.vn/sunworld-ticket/service-sites/asset1/_default_upload_bucket/V%C3%89%20C%C3%81P%20NG%C6%AF%E1%BB%9CI%20L%E1%BB%9AN%20VI%E1%BB%86T%20NAM_%C4%90%E1%BA%A6U%20TU%E1%BA%A6N_3.png',
      ),
      StoreProduct(
        id: '2',
        name: 'CB CABLE & LUNCH BUFFET',
        priceLocalCur: 48,
        imageUrl: 'https://static.sunworld.vn/sunworld-ticket/service-sites/asset1/_default_upload_bucket/CB%20C%C3%81P%20%26%20BUFFET%20TR%C6%AFA%20TR%E1%BA%BA%20EM%20QU%E1%BB%90C%20T%E1%BA%BE%20%28Op2%29_4.png',
      ),
    ]
  ),
  Store(
    id: '4',
    name: 'Da Nang Downtown',
    description: 'Da Nang Downtown (formerly known as Sun World Asia Park amusement park) is oriented to become a "new entertainment district" - a leading shopping and entertainment complex in the city center by the Han River. The park is already famous for bringing a series of unique games that first appeared in Vietnam and perfectly recreated the Eastern kingdom through cultural, architectural and historical landmarks, typical art and culinary performances from 10 countries across Asia, from Japan, Korea, India, China to Vietnam.',
    imageUrls: ['https://duan-sungroup.com/wp-content/uploads/2022/11/cong-vien-chau-a-asia-park-duoc-cai-tao-vao-nam-2020.jpg'],
    miniAppUrl: 'https://ticket.sunworld.vn/khu-vui-choi/da-nang-downtown/',
    website: 'https://sunworld.vn/da-nang-downtown',
    lat: 16.040920,
    lng: 108.223487,
    address: '2 Thang 9, Hoa Cuong Bac, Hai Chau, Da Nang, Viet Nam', 
    type: EStoreType.park,
    priceFromLocalCur: 49.9,
    services: [
      StoreProduct(
        id: '1',
        name: 'Sunwheel Ticket',
        priceLocalCur: 5.9,
        imageUrl: 'https://static04-cdn.oneinventory.com/images/2025/01/8efe5bad464644b293ded8ffe71bc971.jpg',
      ),
      StoreProduct(
        id: '2',
        name: 'All In One Ticket',
        priceLocalCur: 9.9,
        imageUrl: 'https://static04-cdn.oneinventory.com/images/2024/12/adb61504a37e447584c4a5aeb083a147.jpg',
      ),
    ]
  ),
  Store(
    id: '5',
    name: 'Premier Village Danang Resort',
    description: 'Premier Village Da Nang Resort is located along the beautiful My Khe coast, in the center of Central Vietnam. This luxury resort offers a unique combination of comfort and relaxation. The resort has 111 modern villas with many garden-facing and sea-facing villas. Each villa has a spacious living room and dining room, a fully furnished bedroom and a fully equipped kitchen. Whether traveling alone or with family, this resort is the perfect door to explore the historical and cultural values of the coastal city of Da Nang. During your vacation, you can visit UNESCO World Heritage Sites including the mysterious My Son Holy Land, Hoi An ancient town, and poetic Ba Na Hills.',
    imageUrls: ['https://dynamic-media-cdn.tripadvisor.com/media/photo-o/15/c2/f3/88/premier-village-danang.jpg?w=1400&h=-1&s=1'],
    miniAppUrl: 'https://all.accor.com/ssr/app/accor/rates/9530/index.vi.shtml?token=tJP3MqigldIq057QP3WRZGSbmFdT_iPOkR4qMLUilhOC8H1FcKXDBcp3wBzATgeevbDtTtl8Llh-K2foX-VQAkFBA_Anq47Sq1JbRdLb94gQc-0FEJzWHKC2NBDiwzyRfSb-3loyXM7qHMgMUJmMVo1Lc9v02TLdtWDWECQYeQkxEvQ6D0JPZ9P-TV7stnzpH4pwNiByjggEe9sWi_oiS993tUVBxT4S6rLV_pMxsUca99kvo18GpyiOHtSgDqAsKP1ROBD2zVfL4I7eax9xFh-ZWfmW_PmJnbL_lMXnW35XQKWXSnGohDUWUiPyKD-aXxXPV1-_FAxCblfrFCnU8tj_tAVJLOYydi9p_sw0wAgb0alI90KsSlEvNkLoCDAZ8ulSB3rTYGaYzrdvMjYKq6oSd2BEt9eSAMZcw6KiCDbu7ULd1AulhfZMfZpbMyQ0t4C63F9Ip1FeFsgFKy6oSfaOQkbfBhemuTVBkPGzLsgndebaJiRzthvDpJ7fOXLpnkFoGMXRw07-gYMOlvygvdLjLIKV2eEy4UdzaDug9W7F8BllwVi_pVFtyLPZZxZ9klBTlE6fDw9gDHfW6Lr1NQyzgaepm1Yz-jrMumJT7Fb0udZZSu3qjteS6IhElGH0zYEOHtF-1QFH4772IxwQQfgBhdPrun-ALTuUnOpjvHxASg1BdqIVCuRNxpOiv2aTM9SK7ijl7ZfsDcJbWuxUhr3o0kligGF-c2FGRnlc69o1pvz80aQydtBkUIabbTZrwxxEig2UJxVCJDFIlsQ1r66y6hVoXQ3OLBKCERfpB8U7LnnpF-1Fo7H_4QyCt1l--n2N4AK0grUYa9hLpY-IHXzdzKLisuFZjA3Khf7x1M8yFjiAZP2dpObBvUWv7RT73m8trXiaD7_rCUg87JI0CT8b97jtZIy6zmP6N3yt5MPpj8K6HwI9UDS_dYFLUfoNBQPX4npclH_jUYs2EYavYy5jQLiNzPQ_BcJKBXpDlQuSYsaQMSYQ_sB6bnacPNUljEpfFaXMEiIUnmOQDqFQH2a_3imPD5CsYKrHQfJA9T-gIX9-WaC9PwbBfNsS0LmL_jJIcysQ4FBtTVqLNS-78Xw_NtltzlSz56D0m_YM5LdiUD12PoaGj0lRL2FjFWyA50b55lpQIfFm5V1jE3SJBV0cM5JjWmjlP_5nKIY5BAxTJ7kCsU_wHoUs_A46_UJQQlry7nanLVunW9X2IL4keLGxVI48cgbNZtpM0o4uO7wK7MDJz3J9L2mL1vOxyWptWL_ftmix9F10EQx8LXxr0NlJfB2NJwrDbtQW9DHWBndCGaSW&dateIn=2025-01-17&nights=1&compositions=2&stayplus=false&snu=false&accessibleRooms=false&hideWDR=false&productCode=null&hideHotelDetails=true&_gl=1*1psa9wa*_ga*NDYxMzg3Nzg3LjE3MzcxMTkxNTY.*_ga_EWXFMJ33ZG*MTczNzExOTE1NS4xLjAuMTczNzExOTE1NS42MC4wLjA.*_ga_M1MCFT0J4G*MTczNzExOTE1Ni4xLjEuMTczNzExOTE1NS4wLjAuMA..',
    website: 'https://premier-village-danang.com/vi/',
    lat: 16.042280654323836,
    lng: 108.25073967115989, 
    address: '99 Vo Nguyen Giap Street, Da Nang, Vietnam', 
    type: EStoreType.hotel,
    priceFromLocalCur: 499,
    services: [
      StoreProduct(
        id: '1',
        name: 'Garden View Villa 1 Bedroom with Private Swimming Pool',
        priceLocalCur: 299,
        imageUrl: 'https://www.ahstatic.com/photos/9530_rov1b_00_p_346x260.jpg',
      ),
      StoreProduct(
        id: '2',
        name: 'Ocean Access Villa 1 Bedroom with Private Swimming Pool',
        priceLocalCur: 399,
        imageUrl: 'https://www.ahstatic.com/photos/9530_rov1a_00_p_346x260.jpg',
      ),
    ]
  ),
  Store(
    id: '6',
    name: 'Hyatt Regency Danang Resort & Spa',
    description: 'Located on the peaceful white sand of Non Nuoc beach, Hyatt Regency Danang Resort and Spa is the ideal place to stay to explore the exotic charms of Central Vietnam on any occasion, from meetings, events to memorable family vacations. Our hotel is only a few steps away from Marble Mountain and is located near 3 World Heritage Sites recognized by UNESCO as Hue Ancient Capital, Hoi An Ancient Town and My Son Holy Land.',
    imageUrls: ['https://dynamic-media-cdn.tripadvisor.com/media/photo-o/29/2a/a0/36/beach.jpg?w=1400&h=-1&s=1'],
    miniAppUrl: 'https://www.hyatt.com/hyatt-regency/danhr-hyatt-regency-danang-resort-and-spa?src=corp_aspac_corp_aspac_sem_dap_google_br_Corporate_Search_Google_ASPAC_ASPAC_Worldwide-VN_BR_AO_WW-VN_EN_Rooms_DANHR_BR_Phrase_PROP_WW-VN_EN_hyatt+danang',
    website: 'https://www.hyatt.com/hyatt-regency/danhr-hyatt-regency-danang-resort-and-spa?src=corp_aspac_corp_aspac_sem_dap_google_br_Corporate_Search_Google_ASPAC_ASPAC_Worldwide-VN_BR_AO_WW-VN_EN_Rooms_DANHR_BR_Phrase_PROP_WW-VN_EN_hyatt+danang',
    lat: 16.012244107817285,
    lng: 108.26358124482718,
    address: '5 Truong Sa Street, Da Nang, Vietnam', 
    type: EStoreType.hotel,
    priceFromLocalCur: 199,
    services: [
      StoreProduct(
        id: '1',
        name: '1 King Bed',
        priceLocalCur: 199,
        imageUrl: 'https://assets.hyatt.com/content/dam/hyatt/hyattdam/images/2019/01/02/1121/Hyatt-Regency-Danang-Resort-and-Spa-P383-Standard-Garden-King-Guestroom.jpg/Hyatt-Regency-Danang-Resort-and-Spa-P383-Standard-Garden-King-Guestroom.16x9.jpg?imwidth=640',
      ),
      StoreProduct(
        id: '2',
        name: '2 Twin Beds',
        priceLocalCur: 199,
        imageUrl: 'https://assets.hyatt.com/content/dam/hyatt/hyattdam/images/2019/01/02/1121/Hyatt-Regency-Danang-Resort-and-Spa-P384-Standard-Garden-Twin-Guestroom.jpg/Hyatt-Regency-Danang-Resort-and-Spa-P384-Standard-Garden-Twin-Guestroom.16x9.jpg?imwidth=640',
      ),
    ]
  ),
  Store(
    id: '7',
    name: 'All Seasons Buffet',
    description: 'Nestled in the vibrant coastal city of Da Nang, we proudly introduce a dining experience like no other: the city\'s first-ever unlimited lobster buffet.',
    imageUrls: ['https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2b/ef/e8/34/the-best-seafood-buffet.jpg?w=1100&h=-1&s=1'],
    miniAppUrl: 'https://allseasonsbuffet.com/',
    website: 'https://allseasonsbuffet.com/booking-your-table/',
    lat: 16.05567036220949,
    lng: 108.24307611538197, 
    address: '193 Nguyen Van Thoai, An Hai Dong, Ngu Hanh Son, Da Nang, Viet Nam', 
    type: EStoreType.restaurant,
    priceFromLocalCur: 60,
    services: [
      StoreProduct(
        id: '1',
        name: 'All Seasons Lobster & Seafood Menu',
        priceLocalCur: 60,
        imageUrl: 'https://allseasonsbuffet.com/wp-content/uploads/2024/08/Menu-ALL-SEASONS-tong-TV_page-0002_5.jpg',
      ),
    ]
  ),
  Store(
    id: '8',
    name: 'La Plage',
    description: 'Belonging to Sheraton Grand Danang Resort, La Plage Beach Restaurant brings customers the quintessence of Mediterranean cuisine. For those who love to immerse themselves in nature, relaxing with a tropical cocktail under the green coconut canopy by the beach is an experience not to be missed. Enjoying lunch with fresh seafood in the airy restaurant space or sharing stories with friends with a cool glass of craft beer at the bar facing the ocean view, each guest can find a reason to come to La Plage.',
    imageUrls: ['https://dynamic-media-cdn.tripadvisor.com/media/photo-o/28/cf/fd/5c/lobster-thermidor-pomelo.jpg?w=1400&h=-1&s=1'],
    miniAppUrl: 'https://www.laplagedanang.com/',
    website: 'https://www.laplagedanang.com/',
    lat: 15.982626298258097,
    lng: 108.27980262694615,
    address: '35 Truong Sa Street, Hoa Hai Ward, Ngu Hanh Son District, Danang, Danang, Quang Nam', 
    type: EStoreType.restaurant,
    priceFromLocalCur: 23,
    services: [
      StoreProduct(
        id: '1',
        name: 'Mediterranean Seafood Platter',
        priceLocalCur: 89,
        imageUrl: 'https://www.laplagedanang.com/resourcefiles/gallery-images/mediterranean-seafood-platter.jpg?version=12112024045505',
      ),
      StoreProduct(
        id: '2',
        name: 'Cheese Board Sharing Platter',
        priceLocalCur: 23,
        imageUrl: 'https://www.laplagedanang.com/resourcefiles/gallery-images/mezze-platter.jpg?version=12112024045505',
      ),
    ]
  ),
];

@riverpod
class StoreService extends _$StoreService {
  @override
  Future<List<Store>> build() async {
    await Future.delayed(Duration(seconds: 3));
    return mockup;
  }
}