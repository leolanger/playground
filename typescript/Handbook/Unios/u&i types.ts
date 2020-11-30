/* Union Types */

function padLeft(value: string, padding: any) {
    if (typeof padding === "number") {
        return Array(padding + 1).join(" ") + value;
    }
    if (typeof padding === "string") {
        return padding + value;
    }
    throw new Error(`Expected string or number, got '${typeof padding}'.`);
}

padLeft("Hello world", 4);

let indentedString = padLeft("Hello world", true);


function padLeft1(value: string, padding: number | string | boolean) {
    if (typeof padding === "number") {
        return Array(padding + 1).join(" ") + value;
    }
    if (typeof padding === "string") {
        return padding + value;
    }
    throw new Error(`Expected string or number, got '${typeof padding}'.`);
}

padLeft1("Hello world", 4);

let indentedString1 = padLeft1("Hello world", true);

/* Unions with Common Fields */

interface Bird {
    fly(): void;
    layEggs(): void;
}

interface Fish {
    swim(): void;
    layEggs(): void;
}

declare function getSmallPet(): Fish | Bird;

let pet = getSmallPet();
pet.layEggs();
// @ Only available in one of the two possible types
// pet.swim();  error

/* Discriminating Unions */

type NetworkLoadingState = {
    state: "loading";
};

type NetworkFailedState = {
    state: "failed";
    code: number;
};

type NetworkSuccessState = {
    state: "success";
    response: {
        title: string;
        duration: number;
        summary: string;
    };
};

// Create a type which represents only one of the above types
// but you aren't sure which it is yet.
type NetworkState =
    | NetworkLoadingState
    | NetworkFailedState
    | NetworkSuccessState;

function logger(state: NetworkState): string {
    // Right now TypeScript does not know which of the three
    // potential types state could be.

    // Trying to access a property which isn't shared
    // across all types will raise an error
    // @ state.code;
    // Property 'code' does not exist on type 'NetworkState'.
    //    Property 'code' does not exist on type 'NetworkLoadingState'.


    // By switching on state, TypeScript can narrow the union
    // down in code flow analysis
    switch (state.state) {
        case "loading":
            return "Downloading...";
        case "failed":
            // The type must be NetworkFailedState here,
            // so accessing the `code` field is safe
            return `Error ${state.code} downloading`;
        case "success":
            return `Downloaded ${state.response.title} - ${state.response.summary}`;
    }
}

/* Union Exhaustiveness checking */

type NetworkFromCachedState = {
    state: "from_cache";
    id: string;
    response: NetworkSuccessState["response"];
};

type NetworkState1 =
    | NetworkLoadingState
    | NetworkFailedState
    | NetworkSuccessState
    | NetworkFromCachedState;

function assertNever(x: never): never {
    throw new Error("Unexpected object: " + x);
}

function logger1(s: NetworkState1): string {
    switch (s.state) {
        case "loading":
            return "loading request";
        case "failed":
            return `failed with code ${s.code}`;
        case "success":
            return "got response";
        default:
            return assertNever(s);
    }
}


/* Intersection Types */

interface ErrorHandling {
    success: boolean;
    error?: { message: string };
}

interface ArtworksData {
    artworks: { title: string }[];
}

interface ArtistsData {
    artists: { name: string }[];
}

// These interfaces are composed to have
// consistent error handling, and their own data.

type ArtworksResponse = ArtworksData & ErrorHandling;
type ArtistsResponse = ArtistsData & ErrorHandling;

const handleArtistsResponse = (response: ArtistsResponse) => {
    if (response.error) {
        console.error(response.error.message);
        return;
    }

    console.log(response.artists);
};