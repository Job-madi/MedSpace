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
}

export interface postsInterface {
    postId: string,
    author: string,
    title: string,
    content: string,
    datePosted: string,
    upvotes: string,
}

interface userPost {
    postId: string
}

export interface usersInterface {
    username: string,
    password: string,
    posts: userPost[]
    upvotedPosts: userPost[]
}
