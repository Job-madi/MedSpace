export interface doctorsInterface {
    name: string,
    surname: string,
    age: number,
    gender: string,
    medicalField: string,
    licenseNumber: number,
    post: string,
    placeOfWork: string,
    country: string,
    city: string,
    pfpUrl: string,
    doctorId: string,
}

interface comment {
    author: string,
    pfpUrl: string,
    content: string,
    upvotes: string,
    date: string,
}

export interface postsInterface {
    postId: string,
    author: string,
    title: string,
    content: string,
    datePosted: string,
    upvotes: string,
    comments: comment[]
}

interface userPost {
    postId: string
}

export interface usersInterface {
    username: string,
    password: string,
    userId: string,
    pfpUrl: string,
    posts: userPost[]
    upvotedPosts: userPost[],
}
