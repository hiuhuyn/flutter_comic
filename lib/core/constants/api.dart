const kBaseURL = "https://comics-api.vercel.app";

//Popular Comics
//page: number; // option
// path: `/trending-comics?page=${page}`;
const kUrlTrending = "/trending-comics";

// get all genres
const kUrlGenres = "/genres";
// comics by genre
// genre_id: string;
// page: number; // option
// status: 'all' | 'completed' | 'ongoing'; // option
// path: `/genres/${genre_id}`; // trường hợp này sẽ gọi đến dữ liệu của page=1
// path: '/genres/${genre_id}?page=${page}&status=${status}'

// ------------

// search
// query: string;
// page: number; // option
// path: `/search?q=${query}&page=${page}`;
//search suggest
// path: `/search-suggest?q=${query}`;

// recommend comics
const kUrlRecommendComics = "/recommend-comics";

//new comics
// page: number; // option
// status: 'all' | 'completed' | 'ongoing'; // option
// path: `/new-comics?page=${page}&status=${status}`;
const kUrlNewComics = "/new-comics";

// recent-update-comics
// page: number; // option
// status: 'all' | 'completed' | 'ongoing'; // option
// path: `/recent-update-comics?page=${page}&status=${status}`;
const kUrlRecentUpdateComics = "/recent-update-comics";

// boy and girl comics
// page: number; // option
// path: `/boy-comics?page=${page}`;
const kUrlBoyComics = "/boy-comics";
//path: `/girl-comics?page=${page}`;
const kUrlGirlComics = "/girl-comics";

//completed comics
// page: number; // option
// path: `/completed-comics?page=${page}`;
const kUrlCompletedComics = "/completed-comics";

// comic detail
// comic_id: string;
// path: `/comics/${comic_id}`;
const kUrlComic = "/comics";
// comic chapters
// path: `/comics/${comic_id}/chapters`;
// comic single chapter
// chapter_id: number;
// path: `/comics/${comic_id}/chapters/${chapter_id}`;

// top
// page: number; // option
// status: 'all' | 'completed' | 'ongoing'; // option
// // Paths
// All: `/top?page=${page}&status=${status}`;
// Daily: `/top/daily?page=${page}&status=${status}`;
// Weekly: `/top/weekly?page=${page}&status=${status}`;
// Monthly: `/top/monthly?page=${page}&status=${status}`;
// Chapter: `/top/chapter?page=${page}&status=${status}`;
// Follow: `/top/follow?page=${page}&status=${status}`;
// Comment: `/top/comment?page=${page}&status=${status}`;

const kUrlTop = "/top";
const kUrlTopDaily = "/top/daily";
const kUrlTopWeekly = "/top/weekly";
const kUrlTopMonthly = "/top/monthly";
const kUrlTopChapter = "/top/chapter";
const kUrlTopFollow = "/top/follow";
const kUrlTopComment = "/top/comment";
